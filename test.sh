#!/bin/bash

docker build -t act-runner-image:test .

./bin/act --platform ubuntu-latest=act-runner-image:test --workflows test/setup-kotlin.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test --workflows test/setup-java.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test --workflows test/setup-go.yaml --pull=false
./bin/act --platform ubuntu-latest=act-runner-image:test --workflows test/setup-python.yaml --pull=false