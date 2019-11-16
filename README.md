# Introduction to PostGIS
## Prerequisites
- Postgresql 9.6 and PostGIS 2.3 or later is installed as per [Installation Instructions](install.md)

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


## Connect to database
Open pgAdmin. It may prompt you to set a master password. Set it to `sal2019`.

Connect to the local Postgresql 9.6 database by Expanding `Servers` and clicking on `PostgreSQL 9.6`. When you click on the 
database name it will open a connection. 

## Exercises
We are going to follow some exercises from a workshop. The workshop uses a slightly different setup so we are going to jump
past the first few sections. These exercises are basically cookbook recipes to give you good examples for constructing
queries and answering the kinds of spatial questions you want to ask as a GIS professional. In Part 1 of this unit we will 
work our way through Sections 1 through 14, sipping Section 3, since we already installed Postgresql and PostGIS.

[http://postgis.net/workshops/postgis-intro/](https://github.com/ua-gist415-master/postgis-workshops/blob/master/postgis-intro/sources/en/index.rst)

#### [1. Welcome](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/welcome.rst)
#### [2. Introduction](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/introduction.rst)
#### 3. SKIP (You already did this)
#### [4. Creating a Spatial Database](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/creating_db.rst)
#### [5. Loading spatial data](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/loading_data.rst)
#### [6. About our data](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/about_data.rst)
#### [7. Simple SQL](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/simple_sql.rst)
#### [8. Simple SQL Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/simple_sql_exercises.rst)

1. What is the *Asian* population of the City of New York?
2. What is the population of *Manhattan*?
3. For each borough, what percentage of the population is *black*?

#### [9. Geometries](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/geometries.rst)
#### [10. Geometry Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/geometries_exercises.rst)

4. What is the area of the *‘New Brighton’* neighborhood?
5. What is the area of the *Bronx* in acres?
6. How many census blocks in New York City *DO NOT* have a hole in them?
7. What is the total length of streets (in *MILES*) in New York City?
8. How long is ‘5th Ave’?
9. What is the JSON representation of the boundary of ‘Soho’?
10. How many polygons are in the ‘Coney Island’ multipolygon?
11. What are the 5 longest roads in NYC?

#### [11. Spatial Relationships](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/spatial_relationships.rst)
#### [12. Spatial Relationships Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/spatial_relationships_exercises.rst)
12. What is the geometry value for the street named ‘S Oxford St’?
13. What neighborhood and borough is S Oxford St in?
14. What streets does S Oxford St join with?
15. Approximately how many people live on (within 50 meters of) S Oxford St?

#### [13. Spatial Joins](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/joins.rst)
#### [14. Spatial Joins Exercises](https://github.com/ua-gist415-master/postgis-workshops/tree/master/postgis-intro/sources/en/joins_exercises.rst)
16. What subway stations are in ‘East Village’? What subway route is it on?
17. What are all the neighborhoods served by the 4-train?
18. How many people live in the Financial District'
19. What are the population densities (people / km^2) of the ‘East Village’ and ‘West Village?
