#!/bin/bash

service postgresql start

#have to wait for database because it sometimes takes a 
#  long time to start even after the start command returns
echo "Waiting for database"
sleep 20s

createuser osm

createdb -E UTF8 -O osm -T template0 gis

psql -c "CREATE EXTENSION hstore;" -d gis

psql -c "CREATE EXTENSION postgis;" -d gis


psql -c "CREATE ROLE root superuser;" 
psql -c "ALTER ROLE root WITH LOGIN;"


