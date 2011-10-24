class RemoveNmeaStringFromBarcodeLocationsTable < ActiveRecord::Migration
  def change
    remove_column :barcode_locations, :nmea_string
  end
end
