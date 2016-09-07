#!/bin/bash

echo "Checking if Thrift is successfully installed."
OUTPUT=$(docker exec -ti et_container sh -c "thrift -version")

if [[ "${OUTPUT}" =~ "/bin/sh: thrift: not found" ]]
then
	echo "Thrift isn't installed!"
	exit 1
else
	echo "Thrift is installed!"
	exit 0
fi
