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
    t.add :user, :template => :default
  end

  def self.get_all_for_current_user(user_id)
    if user_id == nil 
      return nil
    end
    barcodes = Barcode.where(:user_id => user_id)
    barcodes.each do | bc |
      bc['location'] = BarcodeLocation.where(:barcode_id => bc['id'])
    end
    return barcodes
  end

#  def as_json(options={})
#    super(
#      :only => [:id, :name, :code],
#      :include => :barcode_locations,
#      :include => :user
#    )
#  end
  
#  def location
#    BarcodeLocation.where(:barcode_id => self.id).last
#  end

end
