class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :authentication_token

  # set up relationships to other models
#  has_one :user_location, :class_name => 'BarcodeLocation', :order => 'id DESC'
#  has_many :user_locations
  has_many :barcodes
#  has_many :barcode_locations, :through => :barcodes

#  def ensure_authentication_token!   
#    reset_authentication_token! if authentication_token.blank?   
#  end 

  def as_json(options={})
    super(
      :only => [:id, :email, :authentication_token]
    )
  end
  
end
