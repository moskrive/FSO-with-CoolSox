#!/bin/sh

ARGS="$@"
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

# carts
echo "Building carts container (${VERSION})"
cd carts
sh scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "pushing carts container to dockerhub"
docker push $TAG:carts-$VERSION

# catalogue and catalogue-db
echo ""
echo "Building catalogue and catalogue-db containers (${VERSION})"
cd catalogue
sh scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "pushing catalogue container to dockerhub"
docker push $TAG:catalogue-${VERSION}
echo ""
echo "pushing catalogue container to dockerhub"
docker push $TAG:catalogue-db-${VERSION}

# front-end
echo ""
echo "Building front-end container (version ${VERSION})"
docker build -t $TAG:front-end-$VERSION front-end/.
echo ""
echo "Pushing front-end container to dockerhub"
docker push $TAG:front-end-${VERSION}
echo ""

front-end with BRUM
echo ""
echo "Building front-end appd brum container (version ${VERSION})"
cd front-end-appd-brum
sh scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "Pushing front-end appd brum container to dockerhub"
docker push $TAG:front-end-appd-brum-${VERSION}
echo ""

# orders
echo ""
echo "Building orders container (version ${VERSION})"
cd orders
sh scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "Pushing orders container to dockerhub"
docker push $TAG:orders-${VERSION}
echo ""

# payment
echo ""
echo "Building payment container (version ${VERSION})"
cd payment
sh scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "Pushing payment container to dockerhub"
docker push $TAG:payment-${VERSION}
echo ""

# queue-master
echo ""
echo "Building queue-master container (version ${VERSION})"
cd queue-master
sh scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "Pushing queue-master container to dockerhub"
docker push $TAG:queue-master-${VERSION}
echo ""

# shipping
echo ""
echo "Building shipping container (version ${VERSION})"
cd shipping
sh ./scripts/build.sh $TAG $VERSION
cd ..
echo ""
echo "Pushing shipping container to dockerhub"
docker push $TAG:shipping-${VERSION}
echo ""

# user
echo ""
echo "Building user container (version ${VERSION})"
cd user
docker build -t $TAG:user-$VERSION .
cd ..
echo ""
echo "Pushing user container to dockerhub"
docker push $TAG:user-${VERSION}
echo ""

# user-db
echo ""
echo "Building user-db container (version ${VERSION})"
cd user/docker/user-db
docker build -t $TAG:user-db-$VERSION .
cd ../../..
echo ""
echo "Pushing user-db container to dockerhub"
docker push $TAG:user-db-${VERSION}
echo ""

# load-test
echo ""
echo "Building load-test container (version ${VERSION})"
docker build -t $TAG:load-test-$VERSION load-test/.
echo ""
echo "Pushing load-test container (version ${VERSION}) to dockerhub"
docker push $TAG:load-test-$VERSION
