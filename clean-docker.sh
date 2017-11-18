#!/bin/sh

# cleans all running and exited containers
docker rm -fv $(docker ps -aq)

# cleans all images
docker rmi $(docker images -a)

# cleans all dangling images, exited and created containers
docker images -qf dangling=true
docker ps -aqf status=exited
docker ps -aqf status=created

