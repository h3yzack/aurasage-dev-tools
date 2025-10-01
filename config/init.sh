#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Load environment variables from .env file
if [ -f "$PROJECT_ROOT/.env" ]; then
    set -a
    source "$PROJECT_ROOT/.env"
    set +a
    echo "Loaded environment from: $PROJECT_ROOT/.env"
elif [ -f .env ]; then
    set -a
    source .env
    set +a
    echo "Loaded environment from: ./env"
else
    echo "Error: .env file not found!"
    echo "Please ensure .env exists in the project root: $PROJECT_ROOT"
    exit 1
fi

# Generate files from templates using absolute paths
envsubst < "$SCRIPT_DIR/template/rabbitmq-definitions.json.template" > "$SCRIPT_DIR/rabbitmq-definitions.json"

envsubst < "$SCRIPT_DIR/template/minio-init.sh.template" > "$SCRIPT_DIR/minio-init.sh"

echo "rabbitmq-definitions.json generated using .env variables."

chmod +x "$SCRIPT_DIR/minio-init.sh"

echo "minio-init.sh generated."