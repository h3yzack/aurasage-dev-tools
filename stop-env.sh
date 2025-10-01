#!/bin/bash
# filepath: /workspaces/aurasage/aurasage-dev-tools/stop-env.sh

set -e

show_help() {
    echo "Usage: $0 [profile]"
    echo ""
    echo "Stops and removes the development environment using the specified Docker Compose profile."
    echo "If no profile is provided, defaults to 'documentService'."
    echo ""
    echo "Examples:"
    echo "  $0 documentService"
    echo "  $0 observability"
    echo "  $0 --help"
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
    exit 0
fi

PROFILE=${1:-documentService}

echo "Stopping and removing the development environment with profile: $PROFILE"

docker-compose --profile "$PROFILE" down