#!/usr/bin/bash

sudo apt update || sudo apt upgrade -y

# Docker Installation 

if [[ ('cat /etc/os-release | grep "Ubuntu"') || ('cat /etc/os-release | grep "Debian"') ]]
then 

    # Remove all packages for clean reainstall, uncomment if needed
    # sudo apt-get remove docker docker-engine docker.io containerd runc || sudo apt update
    
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update 
    sudo apt install docker-ce docker-ce-cli containerd.io

    sudo docker run hello-world
elif [ 'cat /etc/os-release | grep "CentOS"' ]
then
    # Remove all packages for clean reainstall, uncomment if needed
    # sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
    
    sudo yum install -y yum-utils
    sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo
    
    sudo yum install docker-ce docker-ce-cli containerd.io

    sudo systemctl start docker
    sudo docker run hello-world
fi


# Docker Compose setup

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Start Portainer 

#./portainerInstall.sh

