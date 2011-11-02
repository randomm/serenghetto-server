class RemoveSridConstraintFromBarcodeLocationsTable < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE barcode_locations DROP CONSTRAINT enforce_srid_geom"
  end

  def self.down
    execute "ALTER TABLE barcode_locations ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 4326)"
  end
end
