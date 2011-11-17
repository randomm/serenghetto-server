class BarcodeLocation < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :barcode, :foreign_key => :barcode_id
  
  acts_as_api
  
  api_accessible :default do | t |
    t.add :name
    t.add :device_timestamp
    t.add :accuracy
    t.add :geom
  end
  
end
