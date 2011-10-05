class AddNotNullToBarcodeFieldInBarcodesTable < ActiveRecord::Migration
  def change
    change_column :barcodes, :barcode, :string, :null => false
  end
end
