class AddDescriptionToUserLocations < ActiveRecord::Migration
  def change
    add_column :user_locations, :description, :text
  end
end
