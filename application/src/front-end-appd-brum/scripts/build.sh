#!/usr/bin/env bash

ARGS="$@"
REPO="${1}"
VERSION="${2}"

if [ "${REPO}x" == "x" ]; then
    echo "REPO is not specified, please try again"
    exit 1
fi

if [ "${VERSION}x" == "x" ]; then
    echo "VERSION is not specified, please try again"
    exit 1
fi

IMAGE_BASE="${REPO}:front-end"
IMAGE="${REPO}:front-end-appd-brum"

set -ev

SCRIPT_DIR=$(dirname "$0")

if [[ "$(uname)" == "Darwin" ]]; then
    DOCKER_CMD=docker
else
    DOCKER_CMD="sudo docker"
fi
CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR

cat Dockerfile-Base | sed "s#__IMAGE__#${IMAGE_BASE}#g" | sed  "s#__VERSION__#${VERSION}#g" > Dockerfile
$DOCKER_CMD build -t ${IMAGE}-$VERSION .;
rm Dockerfile
