# Act Runner Image

Image for running workflows using [act](https://github.com/nektos/act), available for x86 and arm.

[Dockerhub](https://hub.docker.com/repository/docker/fwilhe2/act-runner/general)

Uses scripts taken from [actions/runner-images](https://github.com/actions/runner-images), located in the [vendor](./vendor/) directory.
They are copyrighted by GitHub under the terms of the [license](./vendor/LICENSE).

## Usage

```
act --platform ubuntu-latest=fwilhe2/act-runner:latest
```
