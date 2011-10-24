class AddAccuracyColumnToBarcodeLocationsTable < ActiveRecord::Migration
  def change
    add_column :barcode_locations, :accuracy, :float
  end
end
