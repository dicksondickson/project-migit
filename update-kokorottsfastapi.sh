#!/bin/bash

# Pull the latest kokoro Docker image
docker pull ghcr.io/remsky/kokoro-fastapi-cpu:latest

# Stop the existing kokoro container if it's running
docker stop kokorotts-fastapi

# Remove the existing kokoro container
docker rm kokorotts-fastapi

# Run a new kokoro container
docker run -d \
  -p 8880:8880 \
  --add-host=host.docker.internal:host-gateway \
  --name kokorotts-fastapi \
  --restart always \
  ghcr.io/remsky/kokoro-fastapi-cpu:latest

echo "Kokoro container has been updated and started."

echo "Pruning old images and containers"

docker container prune
docker image prune -a
