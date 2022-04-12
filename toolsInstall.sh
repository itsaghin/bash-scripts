#!/usr/bin/bash

# Script for installing usefull tools 

# Downloads

cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt update 

# Software for system

sudo apt install -y gcc \
make \
perl \
software-properties-common \
net-tools \
python3 \
python3-pip

# Tools 

sudo apt install -y tmux \
htop \
ranger \
./google* \
vim
