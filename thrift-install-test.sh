#!/bin/bash

echo "Checking if Thrift is successfully installed."

if ["${OUTPUT}" = "/bin/sh: thrift: not found"]
then
	echo "Thrift isn't installed!"
	exit 95
else
	echo "Thrift is installed!"
	exit 0
fi

