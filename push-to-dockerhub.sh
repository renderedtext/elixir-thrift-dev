#!/bin/bash

IMG_NAME="renderedtext/elixir-thrift-dev"

IMG_VERSION=$(head -n 1 version)

docker pull "${IMG_NAME}:${IMG_VERSION}"

if [[ $? == 1 ]]; then
    echo "Image of the specified version doesn't exist in the repository."
    echo "Pushing the specified version and updating the latest image."
    docker login --username $DH_USERNAME --password $DH_PASSWORD
    docker tag "${IMG_NAME}" "${IMG_NAME}:${IMG_VERSION}"
    docker push "${IMG_NAME}:${IMG_VERSION}"
    docker tag "${IMG_NAME}:${IMG_VERSION}"  "${IMG_NAME}:latest"
    docker push "${IMG_NAME}:latest"
    docker logout
else
    echo "Image of the specified version already exists in the repository."
fi
