#!/usr/bin/env bash
##############################################################################
# Run in interactive mode for testing purposes
##############################################################################


if [ -z "$1" ]; then
    OUTPUT="$(pwd)/output"
else
    OUTPUT="$1"
fi

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
docker run \
   -it \
   --rm \
   -v "$(pwd):/input:rw" \
   -v "${OUTPUT}:/output:rw" \
   --entrypoint "/bin/bash" \
   ivonet/nas-cli-tools:latest
IFS=$SAVEIFS

