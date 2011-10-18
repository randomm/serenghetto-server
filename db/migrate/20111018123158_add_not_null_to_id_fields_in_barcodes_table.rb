class AddNotNullToIdFieldsInBarcodesTable < ActiveRecord::Migration
  def change
    change_column :barcodes, :user_id, :integer, :null => false
  end
end
