#!/bin/bash

echo "### Pruning containers ###"
docker container prune -f
echo "### Pruning images ###"
docker image prune -f

DIRS=$(find $PWD/zimmerman_tools -maxdepth 2 -type d)

ARGS_DOCKER="build --force-rm --pull --no-cache -q"

for project in $DIRS
do
    name=`basename $project | tr '[:upper:]' '[:lower:]'`
    echo "### Building $name - with Dockerfile ###"
    pushd $project
    docker $ARGS_DOCKER -t $name:latest ./
    popd
done

docker image prune -f
