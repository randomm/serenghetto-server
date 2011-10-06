require 'spec_helper'

describe BarcodeController do

  before (:each) do
    @user = Factory(:user)
    sign_in @user
    @barcode = Factory(:barcode)
  end

  describe "POST 'create'" do
    it "should be successful" do
      @request.env['ACCEPT'] = "text/json" # to only accept JSON response
      post :create, { :name => @barcode.name, :description => @barcode.description, :barcode => @barcode.barcode }, :format => :json
      response.should be_success
    end
  end
  
  describe "GET 'index" do
    it "should be successful" do
      @request.env['ACCEPT'] = "application/json" # to only accept JSON response
      get :index
      response.should be_success
    end
  end


end


