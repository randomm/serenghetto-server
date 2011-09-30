class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations, :options => "ENGINE=MyISAM", :force =>true do |t|
      t.point :geom, :null => false
      t.timestamps
    end
    add_index :user_locations, :geom, :spatial => true
  end
end
