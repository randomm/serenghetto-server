class SessionsController < Devise::SessionsController
  protect_from_forgery :except => :create
  prepend_view_path "app/views/devise"

  def create
    respond_to do |format|  
      format.html { super }  
      format.json { 
        resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
        return sign_in_and_redirect(resource_name, resource)
      }
    end
  end
  
  def new
    super
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    if !current_user.authentication_token
      current_user.reset_authentication_token!
    end
    return render :status => 201, :json => {:message => "Logged in successfully!", :body => { :user => { :email => current_user.email, :id => current_user.id, :token => current_user.authentication_token }}}
#    return render :status => 200, :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end

  def failure
    return render :status => 403, :json => {:message => "Log in failed! Wrong email address or password, perhaps?" }
  end

end
