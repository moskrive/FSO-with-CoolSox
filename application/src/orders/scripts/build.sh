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

IMAGE=orders

set -ev

SCRIPT_DIR=$(dirname "$0")

if [[ "$(uname)" == "Darwin" ]]; then
    DOCKER_CMD=docker
else
    DOCKER_CMD="sudo docker"
fi
CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
$DOCKER_CMD run --rm -v $HOME/.m2:/root/.m2 -v $CODE_DIR:/usr/src/mymaven -w /usr/src/mymaven maven:3.2-jdk-8 mvn -DskipTests package

cp -r $CODE_DIR/docker $CODE_DIR/target/docker/
cp -r $CODE_DIR/target/*.jar $CODE_DIR/target/docker/${IMAGE}

$DOCKER_CMD build -t ${REPO}:${IMAGE}-$VERSION $CODE_DIR/target/docker/${IMAGE};
