#!/usr/bin/env bash
NODE_RED_VERSION=$(grep -oE "\"node-red\": \"(\w*.\w*.\w*.\w*.\w*.)" package.json | cut -d\" -f4)
export NODE_RED_VERSION

echo "#########################################################################"
echo "node-red version: ${NODE_RED_VERSION}"
echo "#########################################################################"

docker build --no-cache \
    --build-arg ARCH=amd64 \
    --build-arg NODE_VERSION=12 \
    --build-arg NODE_RED_VERSION="${NODE_RED_VERSION}" \
    --build-arg OS=buster-slim \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --build-arg TIME_ZONE="Etc/UTC" \
    --build-arg NODES="" \
    --file Dockerfile.debian \
    --tag testing:node-red-build .
