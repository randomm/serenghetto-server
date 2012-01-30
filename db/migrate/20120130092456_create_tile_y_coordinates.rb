class CreateTileYCoordinates < ActiveRecord::Migration
  def change
    create_table :tile_y_coordinates, :force =>true do |t|
      t.point :geom, :null => false, :srid => 4326, :with_z => true
      t.timestamps
    end
    add_index :tile_y_coordinates, :geom, :spatial => true
  end
end
