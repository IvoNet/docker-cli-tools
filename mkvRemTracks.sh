#!/bin/sh
##############################################################################
# Remove audio tracks from an MKV file
##############################################################################
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
mkv="$(basename $1)"
map="$(dirname $1)"
enc="${mkv%.*}.new.mkv"
enc="$(basename $enc)"
docker run \
   --cpuset-cpus="1-2" \
   --rm \
   --name mkvmerge \
   -v "$(pwd)/$map:/input:ro" \
   -v "$(pwd)/$map:/output:rw" \
   --entrypoint "mkvmerge" \
   ivonet/nas-cli-tools:latest \
   -i "/input/$mkv" -o "/output/$enc" --audio-tracks !$2
IFS=$SAVEIFS

