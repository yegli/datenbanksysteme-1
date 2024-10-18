## Run docker container
This container mounts the directory `~/_code/_PRIV/datenbanksysteme-1/pgdata` to persist any configurations made to the database.
```
docker run --name postgres-exercises -e POSTGRES_USER=yanick -e POSTGRES_PASSWORD=12345678 -e POSTGRES_DB=exercise_db -p 5432:5432 -v ~/_code/_PRIV/datenbanksysteme-1/pgdata:/var/lib/postgresql/data -d postgres:16.4-bullseye
```
## Get Administrative Access to the Container Postgress Server
from here list all databases with \l and then connect by using \c databasename 
```
docker exec -it postgres-exercises psql -U yanick -d postgres
```



## Connect to the Database using local 
```
psql -h localhost -U yanick -d exercise_db -p 5432
```


# DB SQL STUFF

> Create Table: CREATE TABLE name (blablabla, blablabla, blabla);

> Get all Values in Table: SELECT * FROM name;

>