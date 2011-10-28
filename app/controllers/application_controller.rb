class ApplicationController < ActionController::Base
  protect_from_forgery
  include FrontendHelpers::Html5Helper

  rescue_from CanCan::AccessDenied do |exception|
    return render :status => 403, :json => {
      :message => "Error, not authorized!",
      :body => {}
    }
  end

end
