SHELL := /bin/bash
.SILENT:

VMANGOS_COMPOSE := docker-compose_vmangos.yml
CMANGOS_COMPOSE := docker-compose_cmangos.yml

.PHONY: help \
	vmangos_build vmangos_run vmangos_down vmangos_clean vmangos_clean_volumes \
	cmangos_build cmangos_run cmangos_down cmangos_clean cmangos_clean_volumes

help: ## Show this help message
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  %-24s %s\n", $$1, $$2}'

# VMANGOS
vmangos_build: ## Build and start vmangos DB + python containers
	echo "Building vmangos..."
	docker compose --file $(VMANGOS_COMPOSE) up --build

vmangos_run: ## Start vmangos containers (no rebuild)
	echo "Running vmangos..."
	docker compose --file $(VMANGOS_COMPOSE) up

vmangos_down: ## Stop vmangos containers
	echo "Stopping vmangos..."
	docker compose --file $(VMANGOS_COMPOSE) down

vmangos_clean: ## Stop vmangos and remove images
	echo "Cleaning vmangos..."
	docker compose --file $(VMANGOS_COMPOSE) down
	docker image rm wow-vmangos-db
	docker image rm wow-vmangos-python

vmangos_clean_volumes: ## Remove vmangos MySQL data volume
	echo "Cleaning vmangos volumes..."
	sudo rm -rf ./volumes/vmangos_mysql

# CMANGOS
cmangos_build: ## Build and start cmangos DB + python containers
	echo "Building cmangos..."
	docker compose --file $(CMANGOS_COMPOSE) up --build

cmangos_run: ## Start cmangos containers (no rebuild)
	echo "Running cmangos..."
	docker compose --file $(CMANGOS_COMPOSE) up

cmangos_down: ## Stop cmangos containers
	echo "Stopping cmangos..."
	docker compose --file $(CMANGOS_COMPOSE) down

cmangos_clean: ## Stop cmangos and remove images
	echo "Cleaning cmangos..."
	docker compose --file $(CMANGOS_COMPOSE) down
	docker image rm wow-cmangos-db
	docker image rm wow-cmangos-python

cmangos_clean_volumes: ## Remove cmangos MySQL data volume
	echo "Cleaning cmangos volumes..."
	sudo rm -rf ./volumes/cmangos_mysql
