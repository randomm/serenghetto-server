class ChangeColumnTypeFromPointToGeometryOnBarcodeLocationsTable < ActiveRecord::Migration
  def change
    change_column :barcode_locations, :geom, :geometry, :srid => 4326, :with_z => true
  end
end
