class UsersController < ApplicationController
  before_filter :authenticate_user!

#  respond_to :html, :only => :index
  respond_to :json, :except => :show

  def show
    @user = User.find(params[:id])
  end
  
  def set_location
    unless params[:user].has_key?(:location)
     return notcreated
    end
    if params[:user][:location] && params[:user][:location].has_key?(:latitude) && params[:user][:location].has_key?(:longitude) && params[:user][:location].has_key?(:timestamp) && params[:user][:location].has_key?(:accuracy)
      user_location = UserLocation.create({
        :user_id => current_user.id,
        :description => params[:user][:location][:description],
        :geom => Point.from_x_y(params[:user][:location][:longitude].to_f, params[:user][:location][:latitude].to_f, 4326)#,
#        :device_timestamp => Time.at(params[:user][:location][:timestamp].to_i),
#        :accuracy => params[:user][:location][:accuracy]
      })
      if user_location
        # return to client
        return render :status => 201, :json => {
          :message => "New user location created.",
          :body => { 
            :user => { 
              :id => current_user.id,
              :location => current_user.location
            }
          }
        }
      else
        return render :status => 403, :json => {
          :message => "Error, location not added! You need to POST latitude, longitude, accuracy and timestamp. Description is optional!",
          :body => {}
        }
      end
    end

  end
  
  def get_location
  end

end
