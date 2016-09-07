#!/bin/bash

img_name="renderedtext/elixir-thrift-dev:"

while IFS='' read -r line || [[ -n "${line}" ]]; do
    img_version=${line}
done < version

docker pull "${img_name}${img_version}"

if [[ $? == 1 ]]; then
    echo "Image of the specified version doesn't exist in the repository. Pushing the specified version and updating the latest image."
    docker tag renderedtext/elixir-thrift-dev ${img_name}${img_version}
    docker push ${img_name}${img_version}
    docker tag ${img_name}${img_version}  ${img_name}latest
    docker push ${img_name}latest
else
    echo "Image of the specified version already exists in the repository."
fi
