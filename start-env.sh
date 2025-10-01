#!/bin/bash
set -euo pipefail

show_help() {
    echo "Usage: $0 [profile]"
    echo ""
    echo "Starts the development environment using the specified Docker Compose profile."
    echo "If no profile is provided, defaults to 'documentService'."
    echo ""
    echo "Examples:"
    echo "  $0 documentService"
    echo "  $0 observability"
    echo "  $0 --help"
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    show_help
    exit 0
fi

PROFILE=${1:-documentService}

# Validate profile
if [[ ! "$PROFILE" =~ ^(documentService|observability)$ ]]; then
    echo "Error: Invalid profile '$PROFILE'. Use 'documentService' or 'observability'"
    exit 1
fi

# Check if .env exists
if [[ ! -f .env ]]; then
    echo "Error: .env file not found. Copy .env.example to .env first."
    exit 1
fi

# Check if initialization is needed
if [[ ! -f config/rabbitmq-definitions.json || ! -f config/minio-init.sh ]]; then
    echo "Configuration files not found. Running initialization..."
    ./config/init.sh
else
    echo "Configuration files exist. Skipping initialization."
fi

echo "Starting the development environment with profile: $PROFILE"

docker-compose --profile "$PROFILE" up -d

echo "--------------------------------------------------------"
echo "AuraSage local environment with profile: $PROFILE is now running!"
echo "--------------------------------------------------------"