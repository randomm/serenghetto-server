# This script creates all "row" starting positions for tiling overlay

R = 6371 # km
TILE_WIDTH = 0.001 # in degrees of longitude
#TILE_WIDTH = 0.05 # in degrees of longitude
WIDTH_HEIGHT_RATIO = 1.8

def to_rad(angle)
  angle/180*Math::PI
end

def to_deg(rad)
  rad*180/Math::PI
end

def getDistance(lat1, lat2, lon1, lon2)
  dLat = to_rad(lat2-lat1)
  dLon = to_rad(lon2-lon1)
  lat1 = to_rad(lat1)
  lat2 = to_rad(lat2)
  a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2)
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
  return R * c
end

def destinationPoint(origin_lat, origin_lon, brng, dist)
  dist = dist/R
  brng = to_rad(brng)
  lat1 = to_rad(origin_lat)
  lon1 = to_rad(origin_lon)

  lat2 = Math.asin( Math.sin(lat1)*Math.cos(dist) + Math.cos(lat1)*Math.sin(dist)*Math.cos(brng))
  lon2 = lon1 + Math.atan2(Math.sin(brng)*Math.sin(dist)*Math.cos(lat1), Math.cos(dist)-Math.sin(lat1)*Math.sin(lat2))
  lon2 = (lon2+3*Math::PI) % (2*Math::PI) - Math::PI
  return  { :latitude => to_deg(lat2),
            :longitude => to_deg(lon2)
          }
end

cnt = 0
lat = -80.0 # create positions between 80 degrees south and 80 degrees north of latitude
while lat <= 80 do # create positions between 80 degrees south and 80 degrees north of latitude
  tile_width_km = getDistance(lat, lat, 0.0, TILE_WIDTH)
  tmp = destinationPoint(lat,0,0,tile_width_km/WIDTH_HEIGHT_RATIO)
  y_deg_diff = tmp[:latitude]-lat
  if cnt % 2 == 0
    lat += y_deg_diff*1.5
    TileYCoordinate.create({
      :geom => Point.from_x_y(0.0, lat, 4326)
    })
  else
    lat += y_deg_diff*1.5
    TileYCoordinate.create({
      :geom => Point.from_x_y(TILE_WIDTH/2, lat, 4326)
    })
  end
  cnt += 1
end
print "Created ",cnt," rows!","\n"