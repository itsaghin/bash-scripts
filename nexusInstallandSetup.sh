#!/usr/bin/bash

# Script for installing and configuring Nexus repo 

cd ~/Downloads

sudo apt update 

sudo apt install openjdk-8-jdk -y 

# Setup user
useradd -M -d /opt/nexus -s /bin/bash -r nexus
echo "nexus   ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/nexus

# Nexus repo donwload and setup
wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz # Change version if needed 
sudo mkdir /opt/nexus
sudo tar xzf nexus-3.29.2-02-unix.tar.gz -C /opt/nexus --strip-components=1
sudo chown -R nexus: /opt/nexus

sed -i 's/2703/1024/g' /opt/nexus/bin/nexus.vmoptions
sed -i 's/#run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc
sed -i 's/\../\./g' /opt/nexus/bin/nexus.vmoptions

# Create nexus.service 
sudo cat > /etc/systemd/system/nexus.service << 'EOL'
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload
systemctl enable --now nexus.service