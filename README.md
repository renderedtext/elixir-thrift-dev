# Elixir Thrift Development Box

A dockerfile for creating an image that enables the usage of elixir and thrift on Linux Alpine. As the base the ```msaraiva/elixir-dev``` image is used. Go [here](https://github.com/msaraiva/docker-alpine/tree/master/dockerfiles/elixir-dev/1.3.1 "msaraiva/elixir-dev") for more information on the base image.

The following packages are additionally installed:
* erlang-xmerl
* curl
* bash

To avoid confusion, Thrift is also installed, but not through a package like the rest are.
