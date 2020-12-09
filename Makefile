.PHONY: help init

CONSUL_VERSION=1.9.0
GRAFANA_VERSION=7.3.4
POSTGRES_VERSION=12
PROMETHEUS_VERSION=v2.1.0
ALERTMANAGER_VERSION=v0.21.0
PUSHGATEWAY_VERSION=v1.3.0
REDIS_VERSION=6.0.8

PASSWORD=secret

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Creates init .env files for services
	@echo "DOCKER_LOCAL_CONSUL_VERSION=${CONSUL_VERSION}" > ./consul/.env
	@echo "DOCKER_LOCAL_GRAFANA_VERSION=${GRAFANA_VERSION}\n\nGF_SECURITY_ADMIN_PASSWORD=${PASSWORD}\nGF_USERS_ALLOW_SIGN_UP=false" > ./grafana/.env
	@echo "DOCKER_LOCAL_POSTGRES_VERSION=${POSTGRES_VERSION}\n\nPOSTGRES_USER=fake\nPOSTGRES_PASSWORD=${PASSWORD}\nPOSTGRES_MULTIPLE_DATABASES=dummy\nPGDATA=/var/lib/postgresql/data/pgdata" > ./postgres/.env.fake
	@echo "DOCKER_LOCAL_PROMETHEUS_VERSION=${PROMETHEUS_VERSION}\nDOCKER_LOCAL_ALERTMANAGER_VERSION=${ALERTMANAGER_VERSION}\nDOCKER_LOCAL_PUSHGATEWAY_VERSION=${PUSHGATEWAY_VERSION}" > ./prometheus/.env
	@echo "DOCKER_LOCAL_REDIS_VERSION=${REDIS_VERSION}" > ./redis/.env