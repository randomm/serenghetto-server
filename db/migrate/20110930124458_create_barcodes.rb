class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.text :barcode, :null => false
      t.text :name
      t.integer :user_id
      t.timestamps
    end
  end
end
