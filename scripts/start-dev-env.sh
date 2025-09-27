#!/bin/bash

echo "Starting AuraSage local development environment..."
echo "This may take a few minutes on the first run to download Docker images."
echo "--------------------------------------------------------"

# Start the services defined in docker-compose.yml in detached mode
docker-compose up -d

# Check if services are healthy (optional but recommended)
echo "--------------------------------------------------------"
echo "Waiting for services to become healthy..."

# Check mongodb with healthcheck
echo "⏳ Waiting for mongodb..."
while true; do
  status=$(docker inspect --format='{{.State.Health.Status}}' aurasage_mongo 2>/dev/null || true)
  if [ "$status" == "healthy" ]; then
    echo "✅ mongodb is ready."
    break
  else
    echo "⏳ Waiting for mongodb..."
    sleep 2
  fi
done

# Check other services by testing if they're running
for service in aurasage_minio aurasage_rabbitmq; do
  service_name=$(echo $service | sed 's/aurasage_//')
  echo "⏳ Waiting for $service_name..."
  while true; do
    status=$(docker inspect --format='{{.State.Status}}' $service 2>/dev/null || true)
    if [ "$status" == "running" ]; then
      echo "✅ $service_name is ready."
      break
    else
      echo "⏳ Waiting for $service_name..."
      sleep 2
    fi
  done
done

echo "--------------------------------------------------------"
echo "AuraSage local environment is now running!"
echo "You can access the services at the following URLs:"
echo "- MongoDB: localhost:27018"
echo "- MinIO Console: http://localhost:9001"
echo "- RabbitMQ Management: http://localhost:15672"
echo "- Grafana: http://localhost:3000"
echo "- Grafana Alloy: http://localhost:12345"
echo "--------------------------------------------------------"