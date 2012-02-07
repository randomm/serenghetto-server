class OverlayController < ApplicationController
  respond_to :json
  def by_viewport
    # need to get viewport dimensions, otherwise return error response
    unless params[:lat1] && params[:lat2] && params[:lon1] && params[:lon2]
     return error
    end

    lat1 = params[:lat1].to_f
    lat2 = params[:lat2].to_f
    lon1 = params[:lon1].to_f
    lon2 = params[:lon2].to_f

    # calculate which ones to use from the returned values
    if lat1 == lat2
      return error("Viewport has no second dimension!")
    end
    if lon1 == lon2
      return error("Viewport has no second dimension!")
    end

    # first calculate number of tiles that should be in the db
    # start with getting the latitude for the top and bottom rows
    # for the given viewport
    lat1_rows = TileYCoordinate.nearest_tile_rows(lat1)
    lat2_rows = TileYCoordinate.nearest_tile_rows(lat2)
    top_row_geom = lat1 > lat2 ? (lat1_rows[0].geom.y > lat1_rows[1].geom.y ? lat1_rows[0].geom : lat1_rows[1].geom) : (lat2_rows[0].geom.y > lat2_rows[1].geom.y ? lat2_rows[0].geom : lat2_rows[1].geom)
    bottom_row_geom = lat1 < lat2 ? (lat1_rows[0].geom.y < lat1_rows[1].geom.y ? lat1_rows[0].geom : lat1_rows[1].geom) : (lat2_rows[0].geom.y < lat2_rows[1].geom.y ? lat2_rows[0].geom : lat2_rows[1].geom)

    # then calculate the longitude for the leftmost column
#    first_row_lon = lon1 < lon2 ? (lon1 / APP_CONFIG.tile_width).abs.floor * APP_CONFIG.tile_width + bottom_row_geom.x

#    debugger
      
    # if we have the tiles, then just output the json
    
    # if we do not, then create tiles and then output the json




    # return to client
    response = {
      :message => "Tile query results returned.",
      :body => {}
    }
    @tiles = Tile.tiles_for_bounding_box({
      :lat1 => params[:lat1],
      :lon1 => params[:lon1],
      :lat2 => params[:lat2],
      :lon2 => params[:lon2]
    })
    return render_for_api :default, :status => 201, :json => @tiles, :root => :barcode, :parent_hash => response, :node => :body
  end
  
  private
  def error(m=nil)
    m = m != nil ? m : "Something went wrong, cannot return overlay!"
    return render :status => 403, :json => {
      :message => m,
      :body => {}
    }
  end
end
