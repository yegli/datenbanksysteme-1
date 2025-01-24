# Run scripts for testat 2
```
psql -U postgres -v ON_ERROR_STOP=on -f 0_runAllScripts.sql
```

## Run docker container
This container mounts the directory `~/_code/_PRIV/datenbanksysteme-1/pgdata` to persist any configurations made to the database.
```
docker run --name postgres-exercises -e POSTGRES_PASSWORD=12345678 -e POSTGRES_DB=testat2_db -p 5432:5432 \
-v /Users/taaegya1/_code/ost/datenbanksysteme-1/pgdata-testat2:/var/lib/postgresql/data \
-v /Users/taaegya1/_code/ost/datenbanksysteme-1/scripts-testat2:/scripts-testat2 -d postgres:16.4-bullseye
```

## Get Administrative Access to the Container Postgress Server
from here list all databases with \l and then connect by using \c databasename 
```
docker exec -it postgres-exercises psql
```

## Run all Scripts
```
docker exec -it postgres-exercises psql -U bob -d postgres -f scripts-testat2/0_runAllScripts.sql
```


## Connect to the Database using local 
```
psql -h localhost -U bob -d default_db -p 5432
```


# DB SQL STUFF

> Create Table: CREATE TABLE name (blablabla, blablabla, blabla);

> Get all Values in Table: SELECT * FROM name;

>
