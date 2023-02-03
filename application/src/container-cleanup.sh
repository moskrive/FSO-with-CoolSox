#!/bin/sh

TAG="${1}"
VERSION="${2}"

if [ "${TAG}x" == "x" ]; then
    echo "Container TAG is not specified, please try again"
    exit 1
fi

if [ "${VERSION}x" == "x" ]; then
    echo "VERSION is not specified, please try again"
    exit 1
fi

docker image rm $TAG:carts-$VERSION
docker image rm $TAG:catalogue-$VERSION
docker image rm $TAG:catalogue-db-$VERSION
docker image rm $TAG:front-end-$VERSION
docker image rm $TAG:front-end-appd-brum-$VERSION
docker image rm $TAG:orders-$VERSION
docker image rm $TAG:payment-$VERSION
docker image rm $TAG:queue-master-$VERSION
docker image rm $TAG:shipping-$VERSION
docker image rm $TAG:user-$VERSION
docker image rm $TAG:user-db-$VERSION
docker image rm $TAG:load-test-$VERSION
