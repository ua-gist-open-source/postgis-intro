
## Installing PostgreSQL and PostGIS

If you are remote or you want to set this up on your home machine:

Install both Postresql and PostGIS. There are various options for installing these. As open source projects with 
potential many different extensions and customizations, a number of companies and organizations bundle their
own copy of PostgreSQL and/or make them available via different tools. The official pages for both are at listed below
though I do recommend two different options for Windows and Mac users:

- PostreSQL: https://www.postgresql.org
- PostGIS: https://postgis.net

### Windows
Windows Users install https://www.enterprisedb.com/downloads/postgres-postgresql-downloads. Make sure to run 
the additional tools using `StackBuilder` and enable the Spatial PostGIS database.

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

## Install pgAdmin 
Download and install pgAdmin from https://www.pgadmin.org/download/
