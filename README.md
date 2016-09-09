# Elixir Thrift Development Box

[![Build Status](https://semaphoreci.com/api/v1/renderedtext/elixir-thrift-dev/branches/master/badge.svg)](https://semaphoreci.com/renderedtext/elixir-thrift-dev)

A dockerfile for creating an image that enables the usage of Elixir and Thrift
on Linux Alpine.

## Usage

### Building an exrm release

Most likely, you'll want to use the the image to build an exrm release 
for an elixir project.

``` bash
docker run --name builder -tdi renderedtext/elixir-thrift-dev
docker cp . builder:/release

docker exec -ti builder sh -c "mix deps.get"
docker exec -ti builder sh -c "mix compile"
docker exec -ti builder sh -c "mix release"

mkdir rel
docker cp builder:/release/rel/$(APP_NAME)/releases/$(VERSION)/$(APP_NAME).tar.gz rel/$(APP_NAME).tar.gz
```

The process of building an exrm release is the following:

1. The source code is copied into the development image
2. An exrm release is created in that image
3. The release is copied on the host machine

Then you can use the release in an Alpine Linux docker image.

![Build Flow Chart](images/build.png)

## Whats in the image

As the base the
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
