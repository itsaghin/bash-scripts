#!/usr/bin/bash

# Stop existing container and remove it
docker stop portainer
docker rm portainer

# Pull latest image <Change if needed>
docker pull cr.portainer.io/portainer/portainer-ce:latest

docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 \
    --name=portainer --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce:latest