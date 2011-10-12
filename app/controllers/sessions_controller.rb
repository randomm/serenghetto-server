class SessionsController < Devise::SessionsController
  protect_from_forgery :except => :create

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
    return sign_in_and_redirect(resource_name, resource)
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :status => 200, :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end

  def failure
    return render :status => 403, :json => {:success => false, :errors => ["Login failed."]}
  end

#  def create  
#    warden.authenticate!(:scope => resource_name)
#    render :status => 200, :json => { :error => "Success" }  
#  end 
  
#  def failure
#    render :status => 401, :json => { :error => "Ggrrhh something went wrong!" }  
#  end

end
