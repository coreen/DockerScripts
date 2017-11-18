#!/bin/bash

# Coreen Yuen
# used to kill all running docker containers on machine
# takes optional regex as command line argument
#   usage: ./kill-docker.sh <regex>
# tested on native Docker for Mac

CTNR_NAME=
if [ $# -ge 1 ]; then
	# optional regex provided, save to variable before override
	CTNR_NAME=$1
fi

if [ -z $CTNR_NAME ]; then
	echo "no regex specified"
else
	echo "regex: $CTNR_NAME"
fi

docker ps |
	# read each line of stdout
	# IFS = internal field separator
	while IFS= read -r line
	do
		# set line in stdin (-- usage), which splits whitespaced arguments into $1, $2, $3, etc.
		# removes need to use `awk` or `cut` to get first element in line
		set -- $line
		# ignore headers and match on regex (blank matches everything)
		if [[ "$1" != "CONTAINER" && $2 == *$CTNR_NAME* ]]; then
			docker kill $1
		fi
	done

