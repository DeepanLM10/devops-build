#!/bin/bash
set -e

IMAGE_NAME=${1:-deepanlm10/dev:latest}

echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

echo "Build completed successfully."
