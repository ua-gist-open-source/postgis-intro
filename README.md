# Assignment: PostGIS I
## Worth: 40 points
## Due: Thursday, April 18, 11:59pm

## Background
PostGIS is an extension to the open source database, PostgreSQL. PostgreSQL, or “postgres”, is released under a special license called the “PostgreSQL License”, which is similar to the BSD or MIT license. PostGIS is released under the GNU General Public License (v2 or later).

## Assignment
Install Postgresql, PostGIS, and pgAdmin. Follow the tutorials linked below and answer the questions listed in this README.md.
These questions are slight variations on the exercise questions listed in the workshop materials. Read carefully
and figure out how to answer the question by tweaking the workshop questions.

Save your answers in a new file named `ANSWERS.md` and commit to a new branch named `postgis`. When you are done, submit a PR to merge with master and send a slack message to the instructor. 

## Install PostgreSQL and PostGIS

Install both Postresql and PostGIS. There are various options for installing these. As open source projects with 
potential many different extensions and customizations, a number of companies and organizations bundle their
own copy of PostgreSQL and/or make them available via different tools. The official pages for both are at listed below
though I do recommend two different options for Windows and Mac users:

- PostreSQL: https://www.postgresql.org/docs/current/tutorial-install.html
- PostGIS: https://postgis.net/install/

## Install pgAdmin 
Download and install pgAdmin from https://www.pgadmin.org/download/

### Windows
Windows Users install https://www.enterprisedb.com/downloads/postgres-postgresql-downloads. Make sure to run 
the additional tools and enable the Spatial PostGIS database.

### Mac
```
brew install postgres
brew install postgis
```
Then decide whether you want to install as a service (meaning it is always running, which I recommend for the duration 
of the class) or manually:
```
To have launchd start postgresql now and restart at login:
  brew services start postgresql
Or, if you don't want/need a background service you can just run:
  pg_ctl -D /usr/local/var/postgres start
```

## Exercises
We are going to follow some exercises from a workshop. The workshop uses a slightly different setup so we are going to jump
past the first few sections. These exercises are basically cookbook recipes to give you good examples for constructing
queries and answering the kinds of spatial questions you want to ask as a GIS professional. In Part 1 of this unit we will 
work our way through Sections 1 through 14, sipping Section 3, since we already installed Postgresql and PostGIS

1. Welcome
2. Introduction
3. SKIP (You already did this)
4. Creating a Spatial Database
5. Loading spatial data
6. About our data
7. Simple SQL
8. Simple SQL Exercises
9. Geometries
10. Geometry Exercises
11. Spatial Relationships
12. Spatial Relationships Exercises
13. Spatial Joins
14. Spatial Joins Exercises

### 8.
- What is the *Asian* population of the City of New York?
- What is the population of *Manhattan*?
- For each borough, what percentage of the population is *black*?

### 10.
- What is the area of the *‘New Brighton’* neighborhood?
- What is the area of the *Bronx* in acres?
- How many census blocks in New York City *DO NOT* have a hole in them?
- What is the total length of streets (in *MILES*) in New York City?
- How long is ‘5th Ave’?
- What is the JSON representation of the boundary of ‘Soho’?
- How many polygons are in the ‘Coney Island’ multipolygon?
- What are the 5 longest roads in NYC?

### 12.
- What is the geometry value for the street named ‘S Oxford St’?
- What neighborhood and borough is S Oxford St in?
- What streets does S Oxford St join with?
- Approximately how many people live on (within 50 meters of) S Oxford St?





