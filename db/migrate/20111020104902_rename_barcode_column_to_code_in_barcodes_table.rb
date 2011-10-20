class RenameBarcodeColumnToCodeInBarcodesTable < ActiveRecord::Migration
  def change
    rename_column :barcodes, :barcode, :code
  end
end
