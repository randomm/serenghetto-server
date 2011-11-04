class ChangeEnforcesOnUserLocationsTable < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE user_locations DROP CONSTRAINT enforce_dims_geom"
    execute "ALTER TABLE user_locations DROP CONSTRAINT enforce_srid_geom"
  end

  def self.down
    execute "ALTER TABLE user_locations ADD CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 3)"
    execute "ALTER TABLE user_locations ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 4326)"
  end
end
