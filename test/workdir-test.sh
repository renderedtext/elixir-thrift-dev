#!/bin/bash

echo "Checking if the parent directory is called 'release'"
WORKDIR=$(docker exec -ti etd_container sh -c "pwd")
if [[ ${WORKDIR} =~ "/release" ]]; then
  echo "Correct name of the parent directory!"
  exit 0
else
  echo "Wrong name of the parent directory!"
  exit 1
fi
