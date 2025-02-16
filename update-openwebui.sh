#!/bin/bash

# Pull the latest Open WebUI Docker image
docker pull ghcr.io/open-webui/open-webui:main

# Stop the existing Open WebUI container if it's running
docker stop open-webui

# Remove the existing Open WebUI container
docker rm open-webui

# Run a new Open WebUI container
docker run -d \
  -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

echo "Open WebUI Docker container has been updated and started."

echo "Pruning old images and containers"

docker container prune
docker image prune -a
