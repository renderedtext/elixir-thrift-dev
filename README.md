# Elixir Thrift Development Box

[![Build Status](https://semaphoreci.com/api/v1/renderedtext/elixir-thrift-dev/branches/master/badge.svg)](https://semaphoreci.com/renderedtext/elixir-thrift-dev)

A dockerfile for creating an image that enables the usage of elixir and thrift
on Linux Alpine. As the base the
[msaraiva/elixir-dev](https://github.com/msaraiva/docker-alpine/tree/master/dockerfiles/elixir-dev/1.3.1 "msaraiva/elixir-dev")
image is used.

The following packages are additionally installed:
* erlang-xmerl
* curl
* bash

To avoid confusion, Thrift is also installed, but not through a package like
the rest are.

It's important to note that the 0.9.3 version of Thrift is installed on the
image currently. With the release of a newer version, the Dockerfile and the
test checking the Thrift version should be updated accordingly.

A folder named `release` is used as the working directory.

## Usage

### Building an exrm release

Most likely, you'll want to use the the image to build a release for an
elixir project.

``` bash
docker run --name builder -tdi renderedtext/elixir-thrift-dev
docker cp . builder:/release

docker exec -ti builder sh -c "mix deps.get"
docker exec -ti builder sh -c "mix compile"
docker exec -ti builder sh -c "mix release"

mkdir rel
docker cp builder:/release/rel/$(APP_NAME)/releases/$(VERSION)/$(APP_NAME).tar.gz rel/$(APP_NAME).tar.gz
```

Basically, the image is ran. Then, the files and folders of the elixir app
(presuming they're in the current directory) are copied into the working
directory of the image, where the release is built. After that, the release is
copied out of the docker image. Then you are free to use the release in another
Alpine Linux docker image.

Here is a flow chart of the process:

![Build Flow Chart](images/build.png)
