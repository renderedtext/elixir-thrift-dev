#!/bin/bash

echo "Checking if the 0.9.3 Thrift version is successfully installed."
OUTPUT=$(docker exec -ti etd_container sh -c "thrift -version")

if [[ "${OUTPUT}" =~ "Thrift version 0.9.3" ]]
then
	echo "Correct version (0.9.3) installed"
	exit 0
else
	echo "Correct version (0.9.3) is not installed!"
	exit 1
fi
