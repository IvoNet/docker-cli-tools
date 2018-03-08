#!/usr/bin/env bash
##############################################################################
# Run in interactive mode for testing purposes
##############################################################################

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
mkv="$(basename $1)"
map="$(dirname $1)"
docker run \
   --rm \
   --name "nas-cli-test" \
   -v "$(pwd)/${map}:/input:ro" \
   -v "$(pwd)/output:/output:rw" \
   --entrypoint "/bin/bash" \
   ivonet/videotools:latest
IFS=$SAVEIFS

