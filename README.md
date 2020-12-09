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

## Postgres

To start service you have to create `./postgres/.env` file.

```bash
POSTGRES_USER=dummy
POSTGRES_PASSWORD=secret
POSTGRES_MULTIPLE_DATABASES=db1,db2
PGDATA=/var/lib/postgresql/data/pgdata
```

Service also using [create multi databases](multiply-pg-db.sh) script. A list of databases that could be created during startup should be provided via `POSTGRES_MULTIPLE_DATABASES` env.

Postgres data directory will be created in [your home directory](https://github.com/dlampsi/docker-local/blob/master/postgres/docker-compose.yml#L26).

## Grafana

To start service you have to create `./grafana/.env` file.

```bash
GF_SECURITY_ADMIN_PASSWORD=secret
GF_USERS_ALLOW_SIGN_UP=false
```