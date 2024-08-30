#!/bin/bash

# build generic amd64 / arm64 image
docker buildx build --push --platform linux/amd64,linux/arm64 -t seanshahkarami/appfl .

# build jetson images
docker build -f Dockerfile.jetson --build-arg JETSON_VERSION=r35.3.1 -t seanshahkarami/appfl:r35.3.1 .
