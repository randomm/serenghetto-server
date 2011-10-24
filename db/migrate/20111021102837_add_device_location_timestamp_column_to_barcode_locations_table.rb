class AddDeviceLocationTimestampColumnToBarcodeLocationsTable < ActiveRecord::Migration
  def change
    add_column :barcode_locations, :device_timestamp, :timestamp
  end
end
