# docker-local

Docker-compose configs and scripts for running various software locally.

## Getting started

To connect all local starting containers between each other all services using an external network must be specified via `DOCKER_LOCAL_NETWORK` environment variable. <br>
It requires to create docker network firstly, then specify env and start containers via `docker-compose`.

```bash
docker network my-docker-network
export DOCKER_LOCAL_NETWORK=my-docker-network
cd consul && docker-compose up -d
```

All services use env vars to get app image versions. So you have to create .env file in each service, that contain app version in format `DOCKER_LOCAL_<APP_NAME>_VERSION=...`. <br>

You can use `make init` command to fill all services by initial `.env` files with default versions.

### Postgres

To start service you have to add to your `./postgres/.env` file:

```bash
POSTGRES_USER=dummy
POSTGRES_PASSWORD=secret
POSTGRES_MULTIPLE_DATABASES=db1,db2
PGDATA=/var/lib/postgresql/data/pgdata
```

Service also using [create multi databases](postgres/multiply-pg-db.sh) script. A list of databases that could be created during startup should be provided via `POSTGRES_MULTIPLE_DATABASES` env.

Postgres data directory will be created in [your home directory](https://github.com/dlampsi/docker-local/blob/master/postgres/docker-compose.yml#L26).
