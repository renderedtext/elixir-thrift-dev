#!/bin/bash

for file in $(ls); do
    if [ "$file" != "test.sh" ]; then
        echo "$file"
        bash "$file"
        RETVAL=$?
        if [ ${RETVAL} != 0 ]; then
          echo "Test $file failed! Exiting..."
          exit 1
        fi
        echo "\n"
    fi
done
