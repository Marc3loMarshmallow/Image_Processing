#! /usr/bin/env bash

PORT="8888"
CIDFILE=".docker_cid"
username=$(whoami)

if [ -e $CIDFILE ]; then
    CID=$(cat $CIDFILE)
    CMD="docker start $CID"
    $CMD
else
    CMD="docker run \
        --cidfile=$CIDFILE \
        -p $PORT:$PORT \
        -v `pwd`:/home/$username/image_processing \
        -d \
        --name image_processing_ss22_container \
        image_processing_ss22"
    echo "$CMD"
    $CMD
fi
