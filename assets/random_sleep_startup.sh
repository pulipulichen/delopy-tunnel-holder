#!/bin/bash

random_seconds=$(( ( RANDOM % 2960 ) + 5 ))  # Generating random number between 5 and 300 (inclusive)

sleep $random_seconds

echo "Slept for $random_seconds seconds"

cd "$(dirname "$0")"
./startup.sh
