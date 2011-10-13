class CreateBarcodeLocations < ActiveRecord::Migration
  def change
    create_table :barcode_locations, :force =>true do |t|
      t.point :geom, :null => false, :srid => 4326, :with_z => true
      t.integer :barcode_id
      t.integer :user_id
      t.string :name
      t.timestamps
    end
    add_index :barcode_locations, :geom, :spatial => true
  end
end
