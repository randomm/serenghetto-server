class RemoveDimsConstraintFromTileYCoordinateTable < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE tile_y_coordinates DROP CONSTRAINT enforce_dims_geom"
  end

  def self.down
    execute "ALTER TABLE tile_y_coordinates ADD CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 3)"
  end
end
