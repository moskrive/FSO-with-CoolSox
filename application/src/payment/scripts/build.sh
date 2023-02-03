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

set -ev

SCRIPT_DIR=$(dirname "$0")

if [[ "$(uname)" == "Darwin" ]]; then
    DOCKER_CMD=docker
else
    DOCKER_CMD="sudo docker"
fi
CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR

cp -r $CODE_DIR/cmd/ $CODE_DIR/docker/payment/cmd/
cp -r $CODE_DIR/middleware/ $CODE_DIR/docker/payment/middleware/
cp $CODE_DIR/*.go $CODE_DIR/docker/payment/
mkdir $CODE_DIR/docker/payment/vendor && cp $CODE_DIR/vendor/manifest $CODE_DIR/docker/payment/vendor/

IMAGE_BASE="${REPO}:payment"

$DOCKER_CMD build -t ${IMAGE_BASE}-dev -f $CODE_DIR/docker/payment/Dockerfile $CODE_DIR/docker/payment;
$DOCKER_CMD create --name payment ${IMAGE_BASE}-dev;
$DOCKER_CMD cp payment:/app/main $CODE_DIR/docker/payment/app;
$DOCKER_CMD rm payment;
$DOCKER_CMD build -t ${IMAGE_BASE}-${VERSION} -f $CODE_DIR/docker/payment/Dockerfile-release $CODE_DIR/docker/payment;
$DOCKER_CMD image rm ${IMAGE_BASE}-dev
