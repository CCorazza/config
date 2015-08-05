echo "\n\n#Algolia OSM aliases :\nalias ber=\"bundle exec rake\"" >> ~/.zshrc
cd ~/Algolia/openstreetmap-website
echo "\033[35mINSTALLS COMPLETE \n\033[33mCREATING DB STARTING\n\n\nNOW\n\033[0m"
sudo -u postgres createuser -s osm_admin
bundle exec rake db:create
psql -d openstreetmap
psql -d osm-test
psql -d osm
bundle exec rake db:create
bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:create RAILS_ENV=test
psql -d openstreetmap -c "CREATE EXTENSION btree_gist"
psql -d osm -c "CREATE EXTENSION btree_gist"
psql -d osm_test -c "CREATE EXTENSION btree_gist"
cd db/functions
echo "\033[35mINSTALLS COMPLETE \n\033[33mCOMPILATING FUNCTIONS  STARTING\n\n\nNOW\n\033[0m"
make libpgosm.so
...
psql -d openstreetmap -c "CREATE FUNCTION maptile_for_point(int8, int8, int4) RETURNS int4 AS '`pwd`/db/functions/libpgosm', 'maptile_for_point' LANGUAGE C STRICT"
psql -d openstreetmap -c "CREATE FUNCTION tile_for_point(int4, int4) RETURNS int8 AS '`pwd`/db/functions/libpgosm', 'tile_for_point' LANGUAGE C STRICT"
psql -d openstreetmap -c "CREATE FUNCTION xid_to_int4(xid) RETURNS int4 AS '`pwd`/db/functions/libpgosm', 'xid_to_int4' LANGUAGE C STRICT"
psql -d osm_test -c "CREATE FUNCTION maptile_for_point(int8, int8, int4) RETURNS int4 AS '`pwd`/db/functions/libpgosm', 'maptile_for_point' LANGUAGE C STRICT"
psql -d osm_test -c "CREATE FUNCTION tile_for_point(int4, int4) RETURNS int8 AS '`pwd`/db/functions/libpgosm', 'tile_for_point' LANGUAGE C STRICT"
psql -d osm_test -c "CREATE FUNCTION xid_to_int4(xid) RETURNS int4 AS '`pwd`/db/functions/libpgosm', 'xid_to_int4' LANGUAGE C STRICT"
psql -d osm -c "CREATE FUNCTION maptile_for_point(int8, int8, int4) RETURNS int4 AS '`pwd`/db/functions/libpgosm', 'maptile_for_point' LANGUAGE C STRICT"
psql -d osm -c "CREATE FUNCTION tile_for_point(int4, int4) RETURNS int8 AS '`pwd`/db/functions/libpgosm', 'tile_for_point' LANGUAGE C STRICT"
psql -d osm -c "CREATE FUNCTION xid_to_int4(xid) RETURNS int4 AS '`pwd`/db/functions/libpgosm', 'xid_to_int4' LANGUAGE C STRICT"
echo "\033[35mFUNCTIONS COMPLETE \n\033[33mMIGRATING DB  STARTING\n\n\nNOW\n\033[0m"
bundle exec rake db:migrate
bundle exec rake db:migrate RAILS_ENV=test
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake test
