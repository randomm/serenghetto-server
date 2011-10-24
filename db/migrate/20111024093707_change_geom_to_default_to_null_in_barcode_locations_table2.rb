class ChangeGeomToDefaultToNullInBarcodeLocationsTable2 < ActiveRecord::Migration
  def change
    change_column :barcode_locations, :geom, :geometry, :null => true
  end
end
