#!/bin/bash

echo "Stopping and removing all AuraSage local development containers..."
echo "This will not delete your data volumes."
echo "--------------------------------------------------------"

docker-compose down

echo "--------------------------------------------------------"
echo "AuraSage local environment has been shut down."
echo "To remove data volumes as well, use 'docker-compose down -v'."