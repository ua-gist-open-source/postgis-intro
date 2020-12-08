#!/bin/bash

if [[ -z $DB_HOST ]]
then
    echo "DB_HOST is required"
    exit 1
fi
if [[ -z $DB_USER ]]
then
    echo "DB_USER is required"
    exit 1
fi
if [[ -z $DB_PORT ]]
then
    echo "DB_PORT is required"
    exit 1
fi
if [[ -z $DATABASE ]]
then
    echo "DATABASE is required"
    exit 1
fi

curl http://s3.cleverelephant.ca/postgis-workshop-2018.zip -o postgis-workshop-2018.zip

# Unzip
unzip postgis-workshop-2018.zip

psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c "CREATE DATABASE $DATABASE"
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DATABASE -c "CREATE EXTENSION postgis"
shps=$(ls *.shp | cut -f6 -d/ | sed 's/.shp//')
for shp in $shps; do
  shp2pgsql -s 4326 -c -g geom ${shp}.shp public.$shp | psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DATABASE
done
