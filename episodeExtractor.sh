#! /bin/bash

# note that this assumes that the HandBrake CLI is installed
# ie: "sudo apt-get install handbrake-cli" on ubuntu
hb=/usr/bin/HandBrakeCLI

# start is the time, in seconds for the beginning of the segmen to be extracted
start=$1

# name is the name to apply to the extracted segment
name=$2

# year is the year of release of the episode / segment being extracted
year=$3

# episode is the episode number of the segment being extracted
episode=$4

# runtime is the *duration* of the extracted segment
# *note that this is *not* the time of position in the larger file for the end of the episode
# but the *duration* of the segment
runtime=$5

# update Origin to reflect the location on disk of the larger video file to be processed
origin="/ssd/plexMedia/dvr/Bugs Bunny and Friends (2021)/Season 2025/Bugs Bunny and Friends (2021) - 2025-03-08 08 00 00 - Bugs Bunny and Friends.mp4"

# Update Destination to reflect the desired output location on disk of the smaller video segment.
# Note that the file name ultimately complies with the stringent naming conventions of Plex Media Server.
destination="/ssd/plexMedia/cartoons/Looney Tunes (1929)/Season ${year}/Looney Tunes (1929) - S${year}E${episode} - ${name}.mp4"

hbArgs=("--verbose" "-i" "${origin}" "--start-at" "seconds:${start}" "--stop-at" "seconds:${runtime}" "--no-markers" "-O" "--align-av" "--encoder" "x265" "--encoder-preset" "medium" "--quality" "22.0" "--aencoder" "copy:ac3" "--subtitle" "none" "-o" "${destination}")

echo "hb command [${hb} \"${hbArgs[@]}\"]"
${hb} "${hbArgs[@]}"
