#!/bin/sh
##############################################################################
# Transcode other formats to x264 in order to stay compatible with older devices
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
   --name "Convert2x264" \
   -v "$(pwd)/$map:/input:ro" \
   -v "/volume1/video/m4v/inbox:/output:rw" \
   --entrypoint "ffmpeg" \
   ivonet/nas-cli-tools:latest \
   -i "/input/$mkv" -map 0 -c:a copy -c:s copy -c:v libx264 "/output/$enc"
IFS=$SAVEIFS

