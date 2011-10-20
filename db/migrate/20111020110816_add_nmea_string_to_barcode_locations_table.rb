class AddNmeaStringToBarcodeLocationsTable < ActiveRecord::Migration
  def change
    add_column :barcode_locations, :nmea_string, :text, :default => :nil
  end
end
