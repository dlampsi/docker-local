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
