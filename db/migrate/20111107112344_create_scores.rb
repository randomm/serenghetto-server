class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :barcode_id
      t.float :score
      t.timestamps
    end
  end
end
