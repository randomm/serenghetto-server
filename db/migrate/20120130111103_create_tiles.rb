class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.polygon :geom, :null => false, :srid => 4326, :with_z => true
      t.timestamps
    end
  end
end