#!/bin/bash
set -e

IMAGE_NAME=${1:-deepanlm10/dev:latest}

echo "Deploying Docker image: $IMAGE_NAME"

docker pull $IMAGE_NAME || true
docker rm -f devops-build-app || true

docker run -d \
  --name devops-build-app \
  -p 80:80 \
  --restart always \
  $IMAGE_NAME

echo "Deployment completed. App running on port 80."

