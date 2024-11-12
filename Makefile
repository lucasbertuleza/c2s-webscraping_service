CLI := $(shell if command -v docker-compose > /dev/null ; then echo "docker-compose" ; else echo "docker compose" ; fi)

build:
	@cp .env.example .env
	@$(CLI) build

up:
	@$(CLI) up -d
	@$(CLI) ps -a --format "table {{.Name}}\t{{.Status}}"

down:
	@$(CLI) down