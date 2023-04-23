# Act Runner Image

Image for running workflows using [act](https://github.com/nektos/act), available for x86 and arm.

[Dockerhub](https://hub.docker.com/repository/docker/fwilhe2/act-runner/general)

Uses scripts taken from [actions/runner-images](https://github.com/actions/runner-images), located in the [vendor](./vendor/) directory.
They are copyrighted by GitHub under the terms of the [license](./vendor/LICENSE).

## Usage

See [nektos/act](https://github.com/nektos/act) for general usage of the `act` tool.

You may specify this image like so in the root directory of your repo:

```
act --platform ubuntu-latest=fwilhe2/act-runner:latest
```

Note that you might need to replace `ubuntu-latest` with your specific ubuntu version such as `22.04` depending in your workflow.
This image only exists with ubuntu 22.04 as of now.

The image exists in the following variants:

- `fwilhe2/act-runner:latest`
    - Base variant which 'only' contains nodejs since this is required as a runtime for actions
    - Smallest variant, still about 1 gb compressed
    - Additional build requirements can be added via the `setup-*` actions
- `fwilhe2/act-runner:latest-jvm`
    - Contains the Eclipse Temurin versions of lts jdk versions and build tools such as maven and gradle
- `fwilhe2/act-runner:latest-rust`
    - Contains the rust compiler and related tooling
- `fwilhe2/act-runner:latest-gcc`
    - Contains gcc
- `fwilhe2/act-runner:latest-clang`
    - Contains clang
