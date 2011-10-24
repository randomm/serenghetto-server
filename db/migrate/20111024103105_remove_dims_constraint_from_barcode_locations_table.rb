class RemoveDimsConstraintFromBarcodeLocationsTable < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE barcode_locations DROP CONSTRAINT enforce_dims_geom"
  end

  def self.down
    execute "ALTER TABLE barcode_locations ADD CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 3)"
  end
end
