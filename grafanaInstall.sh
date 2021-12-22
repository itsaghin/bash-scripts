#!/usr/bin/bash

# Stop existing container and remove it
docker stop grafana 
docker rm grafana
docker image rm grafana/grafana-oss 

# Pull latest image, <change tag if needes>
docker pull grafana/grafana-oss

docker run -d -p 3000:3000 --name grafana grafana/grafana-oss