#!/bin/bash
service postgresql start

#have to wait for database because it sometimes takes a 
#  long time to start even after the start command returns
echo "Waiting for database"
sleep 20s

su - postgres
cd /home/osm
#wget https://github.com/gravitystorm/openstreetmap-carto/archive/v2.41.0.tar.gz
#tar xvf v2.41.0.tar.gz
osm2pgsql --slim -d gis -C 2500 --hstore --number-processes 2 -S openstreetmap-carto-2.41.0/openstreetmap-carto.style sc-latest.pbf


