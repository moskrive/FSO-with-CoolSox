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

export BUILD_VERSION="0.0.2-SNAPSHOT"
export BUILD_DATE=`date +%Y-%m-%dT%T%z`

SCRIPT_DIR=$(dirname "$0")

if [[ "$(uname)" == "Darwin" ]]; then
    DOCKER_CMD=docker
else
    DOCKER_CMD="sudo docker"
fi
CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
$DOCKER_CMD run --rm -v $HOME/.m2:/root/.m2 -v $CODE_DIR:/usr/src/mymaven -w /usr/src/mymaven maven:3.2-jdk-8 mvn -DskipTests package

cp $CODE_DIR/target/*.jar $CODE_DIR/docker/$(basename $CODE_DIR)

for m in ./docker/*/; do
    IMAGE_NAME="${REPO}:$(basename $m)-${VERSION}"
    $DOCKER_CMD build \
      --build-arg BUILD_VERSION=$BUILD_VERSION \
      --build-arg BUILD_DATE=$BUILD_DATE \
      -t ${IMAGE_NAME} $CODE_DIR/$m;
done;
