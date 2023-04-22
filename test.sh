#!/bin/bash

VARIANT=$1

docker build --file=Dockerfile.$VARIANT -t act-runner-image:test-$VARIANT .

./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-kotlin.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-java.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-go.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test-$VARIANT --workflows test/setup-python.yaml --pull=false