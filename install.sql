# OPTION 1
# you need to create all databases following this example

createdb cn_development;
createlang plpgsql cn_development;
psql -d cn_development -f postgis.sql
psql -d cn_development -f spatial_ref_sys.sql


# also your user needs to have certain privileges on the geometry_columns table
GRANT select, insert, update, delete ON TABLE public.geometry_columns TO <user_name>;

# also on the spatial_ref_sys table
GRANT select, insert, update, delete ON TABLE public.spatial_ref_sys TO cn

# ------------------------------------------------------------------------------

# OPTION 2
# you create a template and tell rake to use that template when manipulating databases
# run this in psql console:

CREATE DATABASE template_postgis WITH TEMPLATE=template1 ENCODING='UTF8';
\c template_postgis;
CREATE LANGUAGE plpgsql;
\i /path/to/postgis.sql # in my case: /usr/local/share/postgresql/contrib/postgis-1.5/postgis.sql
\i /path/to/spatial_ref_sys.sql # in my case: /usr/local/share/postgresql/contrib/postgis-1.5/spatial_ref_sys.sql
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template_postgis';
GRANT ALL ON geometry_columns TO PUBLIC;
GRANT ALL ON spatial_ref_sys TO PUBLIC;