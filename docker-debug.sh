#!/bin/sh

# build docker image from Dockerfile and folder context
# outputs <imageId> for successful build
docker build .

# force entrypoint to shell for ensuring running container for debugging
docker run -it --entrypoint=/bin/sh <imageId> 
