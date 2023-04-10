# Act Runner Image

Image for running workflows using [act](https://github.com/nektos/act), available for x86 and arm.

[Dockerhub](https://hub.docker.com/repository/docker/fwilhe2/act-runner/general)

Uses scripts taken from [actions/runner-images](https://github.com/actions/runner-images), located in the [vendor](./vendor/) directory.
They are copyrighted by GitHub under the terms of the [license](./vendor/LICENSE).

Currently this image contains a small set of pre-installed software environments and compilers.
If your workflow uses 'setup-*' actions such as [`setup-java`](https://github.com/actions/setup-java/) or [`setup-go`](https://github.com/actions/setup-go), this should just work.

## Usage

See [nektos/act](https://github.com/nektos/act) for general usage of the `act` tool.

You may specify this image like so in the root directory of your repo:

```
act --platform ubuntu-latest=fwilhe2/act-runner:latest
```

Note that you might need to replace `ubuntu-latest` with your specific ubuntu version such as `22.04` depending in your worflow.
This image only exists with ubuntu 22.04 as of now.
