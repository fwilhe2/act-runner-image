#!/bin/bash

VARIANT=$1

if [ "$VARIANT" = "base" ]; then
    docker build -t act-runner-image:test-$VARIANT .
else
    docker build --file=Dockerfile.$VARIANT -t act-runner-image:test-$VARIANT .
fi

./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/inspect-image.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-kotlin.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-java.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-go.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-python.yaml --pull=false
