#!/bin/bash

echo 'Who are you?'

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' |
sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce -y
sudo systemctl start docker
sudo docker pull owasp/zap2docker-stable
sudo docker run -i owasp/zap2docker-stable zap-cli quick-scan --self-contained \
    --start-options '-config api.disablekey=true' http://10.129.1.178
