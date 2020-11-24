# Introduction to PostGIS
## Prerequisites
- Docker installed

## Deliverables
Create a new branch named `postgis` and submit a `pull request` to merge with master. Your branch should contain answers to the questions in this README in a separate file named 
- `answers.md`

## Background
PostGIS is an extension to the open source database, PostgreSQL. PostgreSQL, or “postgres”, is released under a special license called the “PostgreSQL License”, which is similar to the BSD or MIT license. PostGIS is released under the GNU General Public License (v2 or later).

## Assignment
Install Postgresql, PostGIS, and pgAdmin. Follow the tutorials linked below and answer the questions listed in this README.md.
These questions are slight variations on the exercise questions listed in the workshop materials. Read carefully
and figure out how to answer the question by tweaking the workshop questions.

Copy  your answers in a new file named `answers.md` and commit to a new branch named `postgis`. When you are done, submit a PR to merge with master and send a slack message to the instructor. 

## Data
Data is available from [http://s3.cleverelephant.ca/postgis-workshop-2018.zip](http://s3.cleverelephant.ca/postgis-workshop-2018.zip). Download this and the tutorial will walk you through adding this to your PostGIS Database.

## Start database locally from docker
```
docker run --name postgis -d -v $HOME/postgres_data:/var/lib/postgresql -p 5432:5432 mdillon/postgis
```
## Connect to database
Open pgAdmin. It may prompt you to set a master password. Set it to `postgres` and don't forget it. That's a password to access your pgAdmin GUI.

Connect to the local Postgresql database by Expanding `Servers` and clicking on `localhost:5432` (it should be the only one and may be named slightly differently). When you click on the  database name it will open a connection and the icon will change from a silver platter with a red "x" to a golden platter. 

## Exercises
We are going to follow some exercises from a workshop. The workshop uses a slightly different setup so we are going to jump
past the first few sections. These exercises are basically cookbook recipes to give you good examples for constructing
queries and answering the kinds of spatial questions you want to ask as a GIS professional. In Part 1 of this unit we will 
work our way through Sections 1 through 14, sipping Section 3, since we already installed Postgresql and PostGIS.

Open the "Query Tool" in pgAdmin. You will be writing SQL in the `Query Editor` and `Executing` the SQL by pressing the black "Play" triangle. 

[http://postgis.net/workshops/postgis-intro/](https://github.com/ua-gist415-master/postgis-workshops/blob/master/postgis-intro/sources/en/index.rst)

### [1. Welcome](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/welcome.rst)
### [2. Introduction](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/introduction.rst)
### 4. Creating a Spatial Database (pgAdmin or docker)
#### Instructions for creating spatial database using the pgadmin GUI:
Right click on "Databases" and create a new database named "nyc". Connect to the database and open the Query Tool. Makesure you are connected to the newly created "nyc" database. In the Query Editor, type:
```
CREATE EXTENSION postgis;
```
and click on the black triangle "Play" button.

#### Alternative for creating spatial database using docker:
```
docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data mdillon/postgis sh -c 'psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -c "CREATE DATABASE nyc"'

docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data mdillon/postgis sh -c 'psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -d nyc -c "CREATE EXTENSION postgis"'
```

### 5. Loading spatial data (docker)
Since we are using docker for our postgis and don't have PostGIS installed locally, we are missing a nifty tool for importing shapefiles into PostGIS. But we can work around it using docker principles.

Importing shapefiles into PostGIS is a two-step process. The first step is to use the `shp2pgsql` tool to create SQL scripts that will create the relevant tables and populate them with data. Note that this only creates the _SQL_ files and doesn't actually update the database itself.

From your shell (Terminal or Powershell), Substituting the full path for the unzipped data directory from the NYC sample data (e.g., i.e., instead of `$HOME/Downloads/postgis-workshop-2018/data` it may be `C:/Users/Aaryno/Downloads/postgis-workshop-2018/data`

```
docker run -it --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data mdillon/postgis sh -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_census_blocks.shp public.nyc_census_blocks
```
You should see a LOT of SQL along the lines of:
```
INSERT INTO "public"."nyc_census_blocks" ("blkid","popn_total","popn_white","popn_black","popn_nativ","popn_asian","popn_other","boroname",geom) VALUES ('360050245012000','655','154','174','19','0','308','The Bronx','0106000020266900000100000001030000000100000026000000A03C1ADFED0B224111CCEAEF2A415141E6BD2C8B570C2241FB9F86B221415141BC5D57FF1E0C2241FF0C759C164151417F4AC941D20B2241818751111D415141E62DB195C30B22413E4E1D9C1D415141E8ADD9E3B30B22414C12A2C91D41514168AB5711A40B22411CE16E911D4151415C577C11950B2241D378DDF61C4151419E254FB4870B22410D977F081C4151414DF90861710B22410EC5F36E19415141D52C2C0A5D0B22413AE1628516415141910E41164B0B22414BC1995513415141245630DB3B0B22414B3AC1EB0F415141AC8139992F0B22418D9A43560C415141FA405277260B22417C2CBFA408415141A1375280200B22414DEA32E704415141F6FFB996920B224124FA5DBCFB40514106DE0A6A270B22410D4E59FEE640514120346AFDC60A2241D07FBC98F840514154D0C51A960A22419FB5D03EFF405141F71A508B9F0A22411E69A6D40041514178F7738DC00A22417C90C15F064151418352ACA6CE0A22411610038B0B415141ECF89832D60A2241E039023A0E415141FF53EEBDDE0A22419B5CEFDC10415141083ADE43E80A224171E34E721341514171900DBFF20A2241DFD8ACF815415141194F9729FE0A2241E5B79D6E18415141D04D107D0A0B2241FE1ABFD21A415141E3AB88B2170B224101EBB8231D4151413EB592C2250B224101AC3D601F415141F2C945A5340B224156630B8721415141F0D04252440B2241A94CEC962341514172063BA65E0B2241FB55C87627415141C1A9E8F2800B224100F4057E2A4151412FBEE642A80B2241334544562C41514154FD43B2D00B224101CEBEE12C415141A03C1ADFED0B224111CCEAEF2A415141');
COMMIT;
ANALYZE "public"."nyc_census_blocks";
```
That's the output of `shp2pgsql`. It's SQL and can be run in PostgreSQL to create the appropriate spatial table for `nyc_census_blocks`. To do that we will use another command line utility for interacting with postgres databases, `psql`. We will use the Unix pipe (`|`) operator to "pipe" the SQL from that command into the database as input and have the database create the table and insert the rows:

```
docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data mdillon/postgis sh -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_census_blocks.shp public.nyc_census_blocks | psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -U postgres'
```

It's worth breaking down exactly what docker is doing here with the arguments after `run`. First, note that when we `docker run...` it is launching a _new_ container. It just _happens_ to be the same type as the `mdillon/postgis` container that is listening on port 5432. But docker separates the containers so they don't know each other. However, we _want_ this new container to know about the server so we will "link" it. 
- `--link postgis:postgres` - this allows this new container that we are running to know about our main postgis database
- `--rm` - tells docker to remove the container after it finishes.
- `-v $HOME/Downloads/postgis-workshop-2018/data:/data` - should be familiar; this maps a local directory to a docker directory
- 'mdillon/postgis' - this is the container we are running
- `sh -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_census_blocks.shp public.nyc_census_blocks | psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -U postgres'` -- This is the command we are running in our container...

Ok, now maybe it's perhaps worthwhile to deconstruct _that_^ long command.
- `sh -c` means to execute what's comming next in a shell.
- `shp2pgsql -s 26918 -c -g geom /data/nyc_census_blocks.shp public.nyc_census_blocks` is the command to read the shapefile, nyc_census_blocks.shp, and turn it into SQL commands. 
  - `-s 26918` is the SRID
  - `-c` means include the CREATE statements
  - `-g geom` means the `geom` field is the geometry to use
  - `/data/nyc_census_blocks.shp` - the shapefile to read. Note this is in the docker path internal to this container, not our local workstation path.
  - `public.nyc_census_blocks` is the table to create and insert these into (i.e., the 'public' schema and the 'nyc_census_blocks' table)
- `|` - the "pipe" operator takes the output of the previous command (`shp2pgsql`, which output a bunch of SQL) and redirects it as input the the next command below
- `psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -U postgres` - command that takes the input (SQL) and executes it on a postgres database
  - `-h "$POSTGRES_PORT_5432_TCP_ADDR"` - the host to connect to. The `$POSTGRES_PORT_5432_TCP_ADDR` variable is a special variable that tells this container how to connect to the database and was made accessible when we added the `--link` command to the `docker run` command.
  - `-p "$POSTGRES_PORT_5432_TCP_PORT"` - the 5432 port for the linked container 
  - `-U postgres` - the database user to connect as

Do the same for all the NYC workshop shapefiles (This includes ALL of them, so if you've already added `nyc_census_blocks` above, skip the first line below:
```
docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data --entrypoint sh mdillon/postgis -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_census_blocks.shp public.nyc_census_blocks | psql -h $POSTGRES_PORT_5432_TCP_ADDR -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -d nyc'

docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data --entrypoint sh mdillon/postgis -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_homicides.shp public.nyc_homicides | psql -h $POSTGRES_PORT_5432_TCP_ADDR -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -d nyc'

docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data --entrypoint sh mdillon/postgis -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_neighborhoods.shp public.nyc_neighborhoods | psql -h $POSTGRES_PORT_5432_TCP_ADDR -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -d nyc'

docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data --entrypoint sh mdillon/postgis -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_streets.shp public.nyc_streets | psql -h $POSTGRES_PORT_5432_TCP_ADDR -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -d nyc'

docker run --link postgis:postgres --rm -v $HOME/Downloads/postgis-workshop-2018/data:/data --entrypoint sh mdillon/postgis -c 'shp2pgsql -s 26918 -c -g geom /data/nyc_subway_stations.shp public.nyc_subway_stations | psql -h $POSTGRES_PORT_5432_TCP_ADDR -p $POSTGRES_PORT_5432_TCP_PORT -U postgres -d nyc'

```

_For the rest of the assignment you can use the Query Editor in pgAdmin or, if you are up to the task, use `psql` from within docker`_:

#### docker command to allow `psql` connection to the postgis database:
```
docker run -it --rm --link postgis:postgres --entrypoint sh mdillon/postgis -c 'psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -U postgres'
```
Note we don't need to connect the volume since we don't need the shapefiles any more but we _do_ need the link and link variables.

### [6. About NYC workshop data](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/about_data.rst)
### [7. Simple SQL](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/simple_sql.rst)
### [8. Simple SQL Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/simple_sql_exercises.rst)

1. What is the *Asian* population of the City of New York?
2. What is the population of *Manhattan*?
3. For each borough, what percentage of the population is *black*?

### [9. Geometries](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/geometries.rst)
### [10. Geometry Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/geometries_exercises.rst)

4. What is the area of the *‘New Brighton’* neighborhood?
5. What is the area of the *Bronx* in acres?
6. How many census blocks in New York City *DO NOT* have a hole in them?
7. What is the total length of streets (in *MILES*) in New York City?
8. How long is ‘5th Ave’?
9. What is the JSON representation of the boundary of ‘Soho’?
10. How many polygons are in the ‘Coney Island’ multipolygon?
11. What are the 5 longest roads in NYC?

### [11. Spatial Relationships](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/spatial_relationships.rst)
### [12. Spatial Relationships Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/spatial_relationships_exercises.rst)
12. What is the geometry value for the street named ‘S Oxford St’?
13. What neighborhood and borough is S Oxford St in?
14. What streets does S Oxford St join with?
15. Approximately how many people live on (within 50 meters of) S Oxford St?

### [13. Spatial Joins](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/joins.rst)
### [14. Spatial Joins Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/joins_exercises.rst)
16. What subway stations are in ‘East Village’? What subway route is it on?
17. What are all the neighborhoods served by the 4-train?
18. How many people live in the Financial District'
19. What are the population densities (people / km^2) of the ‘East Village’ and ‘West Village?

[![DOI](https://zenodo.org/badge/180710717.svg)](https://zenodo.org/badge/latestdoi/180710717)
