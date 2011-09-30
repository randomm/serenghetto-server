class CreateBarcodeLocations < ActiveRecord::Migration
  def change
    create_table :barcode_locations do |t|

      t.timestamps
    end
  end
end
