class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :authentication_token

  # set up relationships to other models
  has_many :barcodes

  # set to act as API for JSON responses
  acts_as_api
  
  api_accessible :default do | t |
    t.add :email
    t.add :id
    t.add :name
    t.add :authentication_token
  end
  
end
