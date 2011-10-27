class BarcodeController < ApplicationController

  before_filter :authenticate_user!, :except => :index

  respond_to :html, :only => :index
  respond_to :json, :except => :index  

  def index
    respond_with(@barcodes = Barcode.all, :status => :ok)
  end
  
  def create
    # is this too convoluted: First setting :barcode to nil if its length is 0, and only after the DB fails let the client know? / JT
    unless params[:barcode].has_key?(:code)
     return notcreated
    end
    @barcode = Barcode.create({
      :name => params[:barcode][:name], 
      :user_id => current_user.id, 
      :code => params[:barcode][:code].length > 0 ? params[:barcode][:code] : nil 
    })
    if @barcode.save
      message = "Barcode saved. "
      
      if params[:location] && params[:location].has_key?(:latitude) && params[:location].has_key?(:longitude) && params[:location].has_key?(:timestamp) && params[:location].has_key?(:accuracy)
        @barcode_location = BarcodeLocation.create({
          :barcode_id => @barcode.id,
          :user_id => current_user.id,
          :geom => Point.from_x_y(params[:location][:longitude].to_f, params[:location][:latitude].to_f, 4326),
          :device_timestamp => Time.at(params[:location][:timestamp].to_i),
          :accuracy => params[:location][:accuracy]
        })
        message += "Location information saved."
      end

      # return to client
      return render :status => 201, :json => {
        :message => message, 
        :body => { 
          :barcode => { 
            :id => @barcode.id,
            :name => @barcode.name, 
            :code => @barcode.code 
          }
        }
      }
    else
      return notcreated
    end
  end
  
  def user_list
    @barcodes = Barcode.where(:user_id => current_user.id)

    # return to client
    return render :status => 200, :json => {
      :message => "Complete list of barcodes for current user.", 
      :body => { 
        :entries => @barcodes
      }
    }
  end
  
  private
  def notcreated
    return render :status => 403, :json => {
      :message => "Error, barcode not added!",
      :body => {}
    }
  end
       
end
