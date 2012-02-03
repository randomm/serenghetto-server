class TileYCoordinate < ActiveRecord::Base
  def self.nearest_tile_rows(lat=nil)
    unless lat
      return nil
    end
    lon = APP_CONFIG.tile_width / 4
    points = self.find_by_sql("select * from tile_y_coordinates 
      order by geom <-> ST_setsrid(ST_GeomFromText('POINT(%s %s)', 4326),4326) \
      limit 2
      " % [ lon, lat ])
  end
end
