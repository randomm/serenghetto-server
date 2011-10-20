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
      return render :status => 201, :json => {
        :message => "OK", 
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
  
  private
  def notcreated
    return render :status => 403, :json => {
      :message => "Error, barcode not added!",
      :body => {}
    }
  end
       
end
