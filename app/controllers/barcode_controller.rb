class BarcodeController < ApplicationController

  before_filter :authenticate_user!, :except => :index

  respond_to :html, :only => :index
  respond_to :json, :except => :index  

  def index
    respond_with(@barcodes = Barcode.all, :status => :ok)
  end
  
  def create
    # is this too convoluted: First setting :barcode to nil if its length is 0, and only after the DB fails let the client know? / JT
    @barcode = Barcode.create({:name => params[:name], :user_id => current_user.id, :barcode => params[:barcode].length > 0 ? params[:barcode] : nil })
    if @barcode.save
      return render :status => 201, :json => {:success => true, :barcode => { :name => @barcode.name, :barcode => @barcode.barcode } }
    else
      return render :status => 403, :json => {:success => false }
    end
  end      
end
