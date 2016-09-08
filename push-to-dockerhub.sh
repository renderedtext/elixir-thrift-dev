#!/bin/bash

img_name="renderedtext/elixir-thrift-dev:"

img_version=$(head -n 1 version)

docker pull "${img_name}${img_version}"

if [[ $? == 1 ]]; then
    echo "Image of the specified version doesn't exist in the repository. Pushing the specified version and updating the latest image."
    docker login --username $DH_USERNAME --password $DH_PASSWORD
    docker tag renderedtext/elixir-thrift-dev ${img_name}${img_version}
    docker push ${img_name}${img_version}
    docker tag ${img_name}${img_version}  ${img_name}latest
    docker push ${img_name}latest
    docker logout
else
    echo "Image of the specified version already exists in the repository."
fi
