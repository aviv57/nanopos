#!/bin/bash

# Batch Thunderification of sounds
# you will need the files thunder.mp3 and silence.mp3 on the same dir as the script
# mp3 files in SOURCE_DIR will be merged with thunder.mp3 and saved to DEST_DIR
# It will start with a bang and later rain in the background :)

# (Upload to https://embassy-sounds.netlify.com to get them played on new payments)

hlp="Use: thunderfy.sh [source dir] [destination dir]"

SOURCE_DIR=$1
DEST_DIR=$2

if [ $# -ne 2 ]; then
    echo $hlp
    exit 1
fi

for mp3file in $(ls ${SOURCE_DIR}/*.mp3) ; do
    ffmpeg -y -i "concat:$mp3file|silence.mp3" -c copy ${DEST_DIR}/tmp.mp3 
    ffmpeg -y -i ${DEST_DIR}/tmp.mp3 -i thunder.mp3 -filter_complex "[0]adelay=4000|4000[yakir]; [1][yakir]amix=inputs=2:duration=shortest:dropout_transition=0,dynaudnorm" ${DEST_DIR}/tmp2.mp3
    ffmpeg -y -i ${DEST_DIR}/tmp2.mp3 -filter_complex "afade=d=1, areverse, afade=d=2, areverse" ${DEST_DIR}/$(basename $mp3file)
    echo Created ${DEST_DIR}/$(basename $mp3file)
done

rm -f ${DEST_DIR}/tmp.mp3 ${DEST_DIR}/tmp2.mp3
