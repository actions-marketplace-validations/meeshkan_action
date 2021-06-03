#!/bin/sh
set -e -u

VERSION=0.1
IMAGE_NAME=meeshkan/runner
IMAGE_SPECIFIER=${IMAGE_NAME}:${VERSION}

docker build --tag ${IMAGE_SPECIFIER} .
docker tag ${IMAGE_SPECIFIER} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}
