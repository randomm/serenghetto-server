class CreateTileYCoordinates < ActiveRecord::Migration
  def change
    create_table :tile_y_coordinates, :force =>true do |t|
      t.float :x, :null => false
      t.float :y, :null => false
      t.timestamps
    end
  end
end
