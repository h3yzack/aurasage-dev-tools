# AuraSage Dev Tools

This repository contains all the necessary scripts and configurations to set up and manage the local development environment for the AuraSage platform.

It uses **Docker Compose** to orchestrate all the required infrastructure services, ensuring a consistent and isolated environment for all developers.

## Prerequisites

* **Docker:** [Get Docker here](https://www.docker.com/get-started)
* **Docker Compose:** Comes bundled with Docker Desktop.

## Local Environment Services

The `docker-compose.yml` file defines the following services:

* **MongoDB:** The primary database for all services.
* **MinIO:** An S3-compatible object storage solution for storing documents.
* **RabbitMQ:** The message queue for asynchronous communication between services.
* **AuraSage Microservices:** A placeholder for each microservices.

## Getting Started

1.  **Start the environment:**
    Run the `start-dev-env.sh` script. This will build and start all the services.
    `./start-dev-env.sh`


## Stopping the Environment

To stop all the running containers without deleting your data volumes, run the `tear-down-env.sh` script:

`./tear-down-env.sh`

For a complete cleanup, including data volumes, use `docker-compose down -v`.

---
