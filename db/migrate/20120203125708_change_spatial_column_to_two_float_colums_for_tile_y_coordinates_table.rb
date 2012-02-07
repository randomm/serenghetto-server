class ChangeSpatialColumnToTwoFloatColumsForTileYCoordinatesTable < ActiveRecord::Migration
  def up
    remove_column :tile_y_coordinates, :geom
#    remove_index :tile_y_coordinates, :geom
    add_column :tile_y_coordinates, :x, :float, :null => false
    add_column :tile_y_coordinates, :y, :float, :null => false
  end

  def down
    add_column :tile_y_coordinates, :geom, :null => false, :srid => 4326, :with_z => true
    add_index :tile_y_coordinates, :geom, :spatial => true
  end
end
