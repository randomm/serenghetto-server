class OverlayController < ApplicationController
  respond_to :json
  def by_viewport
    # need to get viewport dimensions, otherwise return error response
    unless params[:barcode].has_key?(:lat1) && params[:barcode].has_key?(:lat2) && params[:barcode].has_key?(:lon1) && params[:barcode].has_key?(:lon2)
     return notcreated
    end
  end
  
  private
  def error
    return render :status => 403, :json => {
      :message => "Something went wrong, cannot return overlay!",
      :body => {}
    }
  end
end
