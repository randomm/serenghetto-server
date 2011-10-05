class BarcodeController < ApplicationController

  respond_to :html, :only => :index
  respond_to :xml, :json, :except => :index  

  def index
    respond_with(@barcodes = Barcode.all, :status => :ok)
  end
  
  def create
    # is this too convoluted: First setting :barcode to nil if its length is 0, and only after the DB fails let the client know? / JT
    @barcode = Barcode.create({:name => params[:name], :description => params[:description], :barcode => params[:barcode].length > 0 ? params[:barcode] : nil})
    if @barcode.save
      respond_to do |format|
        format.json { render :json => @barcode, :status => :created }
      end
    else
      respond_to do |format|
        format.json { render :json => @barcode.errors, :status => :unprocessable_entity }
      end
    end
  end      
end
