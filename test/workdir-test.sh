#!/bin/bash

echo "Checking if the parent directory is called 'release'"
WORKDIR=$(docker exec -ti etd_container sh -c "pwd")
if [[ ${WORKDIR} == "/release" ]]; then
  echo "Success!"
  exit 0
else
  echo "Failure!"
  exit 1
fi
