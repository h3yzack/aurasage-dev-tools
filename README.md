# AuraSage Dev Tools

Scripts and configuration files for running the AuraSage development environment with Docker Compose.

## Prerequisites
* Docker ([Install guide](https://www.docker.com/get-started))
* Docker Compose (included with Docker Desktop)

## Setup

1. Copy `.env.example` to `.env` and adjust values as needed
2. Initialize configuration: `make init`

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

### Using Make (recommended)
```bash
make init          # Initialize configuration
make up            # Start documentService profile
make up-obs        # Start observability profile
make down          # Stop all environments
make clean         # Remove containers and volumes
make logs          # Follow logs
make status        # Show service status
```

### Using scripts directly
Start environment:
```bash
./start-env.sh [profile]
./start-env.sh documentService  # default
./start-env.sh observability
```

Stop environment:
```bash
./stop-env.sh [profile]
```

## Configuration

* `config/` - Initialization scripts and service configurations
* `observability/` - Monitoring, logging, and tracing configurations
* Templates in `config/template/` are processed by `init.sh` using environment variables
* See `SERVICES.md` for ports and credentials
