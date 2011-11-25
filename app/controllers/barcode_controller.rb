class BarcodeController < ApplicationController

  before_filter :authenticate_user!, :except => [ :index, :show ]

#  respond_to :html, :only => :index
  respond_to :json #, :except => :index  

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
          :device_timestamp => Time.at((params[:location][:timestamp].to_i/1000)),
          :accuracy => params[:location][:accuracy]
        })
        message += "Location information saved."
      end
    else
      return notcreated
    end
    
    # calculate score
    Score.set_score(@barcode)

    # return to client
    response = {
      :message => message, 
      :body => {}
    }
    @barcodes = Barcode.where(:id => params[:id]) # to get an array for render_for_api
    return render_for_api :default, :status => 201, :json => @barcode, :root => :barcode, :parent_hash => response, :node => :body
  end
  
  def user_barcodes
    response = {
      :message => "All barcodes in the system.", 
      :body => {}
    }
    @barcodes = Barcode.user_barcodes(current_user.id)
    return render_for_api :default, :status => 200, :json => @barcodes, :root => :entries, :parent_hash => response, :node => :body
  end
  
  def index
    response = {
      :message => "All barcodes in the system.", 
      :body => {}
    }
    @barcodes = Barcode.all() # to get an array for render_for_api
    return render_for_api :default, :status => 200, :json => @barcodes, :root => :entries, :parent_hash => response, :node => :body
  end
  
  def show
    response = {
      :message => "Single barcode with location and user information.", 
      :body => {}
    }
    @barcodes = Barcode.where(:id => params[:id]) # to get an array for render_for_api
    return render_for_api :default, :status => 200, :json => @barcodes, :root => :entries, :parent_hash => response, :node => :body
  end
  
  private
  def notcreated
    return render :status => 403, :json => {
      :message => "Error, barcode not added!",
      :body => {}
    }
  end
  
  def get_score
    
  end
       
end
