# Services

Ports, credentials, and access information for development services.

## Profiles

- `documentService` (default)
- `observability`

## documentService Profile

### MongoDB
- **Port**: `27018` (mapped from internal 27017)
- **Username**: `aurasage` (from AURASAGE_USER)
- **Password**: `devpassword` (from AURASAGE_PASS)
- **Database**: `aurasage_document` (from AURASAGE_DOCUMENT_DB)
- **Connection URL**: `mongodb://aurasage:devpassword@localhost:27018/aurasage_document`

### MinIO (Object Storage)
- **API Port**: `9000`
- **Console Port**: `9001`
- **Username**: `aurasage` (from AURASAGE_USER)
- **Password**: `devpassword` (from AURASAGE_PASS)
- **Console URL**: http://localhost:9001
- **API Endpoint**: http://localhost:9000
- **Default Bucket**: `aurasage` (from BUCKET_NAME)

### RabbitMQ (Message Queue)
- **AMQP Port**: `5672`
- **Management UI Port**: `15672`
- **Username**: `aurasage` (from AURASAGE_USER)
- **Password**: `devpassword` (from AURASAGE_PASS)
- **Management URL**: http://localhost:15672
- **Exchange**: `storage.events` (from EXCHANGE_NAME)
- **Queue**: `storage.queue` (from QUEUE_NAME)
- **Routing Key**: `storage.notifications` (from ROUTING_KEY)

## observability Profile

### Loki (Log Aggregation)
- **Port**: `3100`
- **API URL**: http://localhost:3100
- **No authentication required**

### Alloy (Data Collection)
- **HTTP Port**: `12345`
- **OTLP Port**: `4318`
- **UI URL**: http://localhost:12345
- **No authentication required**

### Prometheus (Metrics)
- **Port**: `9090`
- **Web UI**: http://localhost:9090
- **No authentication required**

### Grafana (Visualization)
- **Port**: `3000`
- **Web UI**: http://localhost:3000
- **Authentication**: Anonymous access enabled (Admin role)
- **No login required**

### Zipkin (Distributed Tracing)
- **Port**: `9411`
- **Web UI**: http://localhost:9411
- **No authentication required**

## Configuration

Default values (`.env.example`):
```bash
AURASAGE_USER=aurasage
AURASAGE_PASS=devpassword
AURASAGE_DOCUMENT_DB=aurasage_document
EXCHANGE_NAME=storage.events
QUEUE_NAME=storage.queue
ROUTING_KEY=storage.notifications
BUCKET_NAME=aurasage
```



## Quick Access URLs

When running the **documentService** profile:
- MinIO Console: http://localhost:9001
- RabbitMQ Management: http://localhost:15672

When running the **observability** profile:
- Grafana: http://localhost:3000
- Prometheus: http://localhost:9090
- Zipkin: http://localhost:9411
- Alloy: http://localhost:12345

## Dependencies

- Alloy → Loki
- Grafana → Prometheus
- MinIO → RabbitMQ

## Troubleshooting

**Port conflicts**: Check if ports are already in use
**Permissions**: Ensure Docker has sufficient access
**Network**: Services use `aurasage` Docker network

### Checking Service Status
```bash
make status           # Check all services
docker-compose ps     # List running containers
docker-compose logs   # View service logs
```