#!/bin/bash

docker run --name etd_container -tdi renderedtext/elixir-thrift-dev

ALL_PASSED=0
for FILE in $(ls test); do
    if [[ "$FILE" != "test.sh" ]]; then
        echo "$FILE"
        if ! bash "test/$FILE" ; then
          echo "Test $FILE failed!"
          ALL_PASSED=1
        fi
        echo -e "\n"
    fi
done

docker stop etd_container
docker rm etd_container

if [[ "$ALL_PASSED" == 0 ]]; then
  echo "All tests have passed!"
  exit 0
else
  echo "One or more tests have failed!"
  exit 1
fi
