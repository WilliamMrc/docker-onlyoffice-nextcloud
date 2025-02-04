#!/bin/bash
# Un script pour initialiser une instance amazon avec l'image docker NC+OO

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

sudo apt-get install --yes \
   ca-certificates \
   curl \
   gnupg \
   lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp - docker
