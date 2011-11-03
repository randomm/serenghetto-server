class BarcodeLocation < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :barcode, :foreign_key => :barcode_id
  
  acts_as_api
  
  api_accessible :default do | t |
    t.add :name
    t.add :geom
  end
  
  
  # By default, use the GEOS implementation for spatial columns.
  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # But use a geographic implementation for the :latlon column.
  set_rgeo_factory_for_column(:geom, RGeo::Geographic.spherical_factory)

  def as_json(options={})
    super(
      :only => [:id, :name]
    )
  end

end
