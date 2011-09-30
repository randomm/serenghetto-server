class AddUserIdToUserLocationTable < ActiveRecord::Migration
  def change
    add_column :user_locations, :user_id, :integer
  end
end
