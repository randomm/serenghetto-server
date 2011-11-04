class Barcode < ActiveRecord::Base

  belongs_to :user, :foreign_key => :user_id
  has_one :location, :class_name => 'BarcodeLocation', :order => 'id DESC'
#  has_many :barcode_locations
#  has_many :barcode_locations, :order => 'id DESC'
#  default_scope :include => :barcode_locations
#  has_many :barcode_locations
#  default_scope :include => :barcode_locations

  acts_as_api
  
  api_accessible :default do | t |
    t.add :name
    t.add :code
    t.add :location, :template => :default
    t.add :user, :template => :public
  end

  def self.user_barcodes(user_id=nil)
    self.where(:user_id => user_id)
  end

end
