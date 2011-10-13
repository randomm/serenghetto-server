class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations, :force =>true do |t|
      t.point :geom, :null => false, :srid => 4326, :with_z => true
      t.timestamps
    end
    add_index :user_locations, :geom, :spatial => true
  end
end
