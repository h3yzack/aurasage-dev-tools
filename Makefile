.PHONY: help init up up-obs down clean logs status
.DEFAULT_GOAL := help

help: ## Show available commands
	@echo "Available commands:"
	@echo "  init          Initialize the environment"
	@echo "  up            Start the document service environment"
	@echo "  up-obs        Start the observability environment"
	@echo "  down          Stop all environments"
	@echo "  clean         Remove all containers and volumes for all profiles"
	@echo "  logs          Follow logs for running services"
	@echo "  status        Show status of all services"

init: ## Initialize configuration from templates
	@./config/init.sh

up: ## Start documentService environment
	@./start-env.sh documentService

up-obs: ## Start observability environment
	@./start-env.sh observability

down: ## Stop all environments
	@./stop-env.sh

clean: ## Remove all containers and volumes for all profiles
	@docker-compose --profile documentService down -v --remove-orphans
	@docker-compose --profile observability down -v --remove-orphans
	@echo "Cleaned up all profiles"

logs: ## Follow logs for running services
	@if docker-compose ps --services --filter status=running | grep -q .; then \
		docker-compose logs -f; \
	else \
		echo "No running services found. Start a profile first with 'make up' or 'make up-obs'"; \
	fi

status: ## Show status of all services
	@echo "Document Service Profile:"
	@docker-compose --profile documentService ps
	@echo ""
	@echo "Observability Profile:"
	@docker-compose --profile observability ps