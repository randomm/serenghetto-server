class TileYCoordinate < ActiveRecord::Base
  def self.get_rows(lat1=nil, lat2=nil)
    unless lat1 && lat2 
      return []
    end
    if (lat1 > lat2)
      self.where("y > ? AND y < ?", lat2, lat1).order("y asc")
    else
      self.where("y < ? AND y > ?", lat2, lat1).order("y asc")
    end
  end
end
