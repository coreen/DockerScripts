#!/bin/bash

# Coreen Yuen
# used to query the latest tags from public docker registry

read -p "Image: " IMAGE_NAME

wget -q https://registry.hub.docker.com/v1/repositories/${IMAGE_NAME}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'

