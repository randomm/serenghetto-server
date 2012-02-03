class Tile < ActiveRecord::Base
  acts_as_api
  
  api_accessible :default do | t |
    t.add :geom
  end

  def self.tiles_for_bounding_box(box=nil)
    unless box.has_key?(:lat1) && box.has_key?(:lat2) && box.has_key?(:lon1) && box.has_key?(:lon2) 
      return []
    end
    self.find_by_sql("select * from tiles where geom && \
      ST_GeomFromText('POLYGON((%s %s, %s %s, %s %s, %s %s, %s %s))', 4326) \
      " % [ box[:lat1], box[:lon1], box[:lat2], box[:lon1], box[:lat2], box[:lon2], box[:lat1], box[:lon2], box[:lat1], box[:lon1] ])
  end

end
