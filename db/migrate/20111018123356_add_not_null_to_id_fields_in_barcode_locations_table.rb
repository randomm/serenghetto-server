class AddNotNullToIdFieldsInBarcodeLocationsTable < ActiveRecord::Migration
  def change
    change_column :barcode_locations, :user_id, :integer, :null => false
    change_column :barcode_locations, :barcode_id, :integer, :null => false
  end
end
