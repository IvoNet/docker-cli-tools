#!/bin/sh
##############################################################################
# Provide movie information from a video file (MKV)
##############################################################################

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
mkv="$(basename $1)"
map="$(dirname $1)"
docker run \
   --rm \
   --name "mkvinfo" \
   -v "$(pwd)/$map:/input:ro" \
   --entrypoint "mkvinfo" \
   ivonet/nas-cli-tools:latest \
   "/input/$mkv"
IFS=$SAVEIFS

