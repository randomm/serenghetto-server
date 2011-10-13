# you need to create all databases following this example
createdb cn_development;
createlang plpgsql cn_development;
psql -d cn_development -f postgis.sql
psql -d cn_development -f spatial_ref_sys.sql


# also your user needs to have certain privileges on the geometry_columns table
GRANT select, insert, update, delete ON TABLE public.geometry_columns TO <user_name>;

# also on the spatial_ref_sys table
GRANT select, insert, update, delete ON TABLE public.spatial_ref_sys TO cn