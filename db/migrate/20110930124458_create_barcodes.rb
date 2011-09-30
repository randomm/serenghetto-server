class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.text :barcode, :null => false
      t.text :name
      t.text :description
      t.timestamps
    end
  end
end
