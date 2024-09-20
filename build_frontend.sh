#!/bin/bash
NPMRC_ENV=${1:-home}
docker build -f Dockerfile.frontend -t my-frontend-app --build-arg NPMRC_ENV=$NPMRC_ENV .
docker image prune -f
docker images