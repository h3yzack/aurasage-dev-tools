# AuraSage Dev Tools

Scripts and configuration files for running the AuraSage development environment with Docker Compose.

## Prerequisites
* Docker ([Install guide](https://www.docker.com/get-started))
* Docker Compose (included with Docker Desktop)

## Setup

1. Copy `.env.example` to `.env` and adjust values as needed
2. Run the initialization script to generate config files from templates

## Services

Two profiles are available:

### documentService (default)
* MongoDB (database on port 27018)
* MinIO (object storage on ports 9000/9001)
* RabbitMQ (message queue on ports 5672/15672)

### observability
* Loki (log aggregation on port 3100)
* Alloy (data collection on ports 12345/4318)
* Prometheus (metrics on port 9090)
* Grafana (visualization on port 3000)
* Zipkin (tracing on port 9411)

## Usage

Start environment with a profile:
```bash
./start-env.sh [profile]
./start-env.sh documentService  # default
./start-env.sh observability
```

Stop environment:
```bash
./stop-env.sh [profile]
```

Remove containers and volumes:
```bash
docker-compose --profile [profile] down -v
```

## Configuration

* `config/` - Initialization scripts and service configurations
* `observability/` - Monitoring, logging, and tracing configurations
* Templates in `config/template/` are processed by `init.sh` using environment variables
