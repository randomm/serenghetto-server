class ChangeGeomToDefaultToNullInBarcodeLocationsTable < ActiveRecord::Migration
  def change
    change_column_default :barcode_locations, :geom, nil
  end
end
