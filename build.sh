#!/bin/bash

if [[ -z "${DOCKER_HUB_ID}" ]]; then
  echo "Set DOCKER_HUB_ID env var first."
  exit 1
fi

docker build \
  -t $DOCKER_HUB_ID/geolite2-web-service \
  .
