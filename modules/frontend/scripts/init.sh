#!/bin/bash
sudo yum install docker -y
sudo usermod -aG docker ec2-user
sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo echo  "sudo docker run -d --name docker-nginx -p 80:80 nginx:latest" > /var/lib/cloud/scripts/per-boot/n.sh
sudo chmod 777 /var/lib/cloud/scripts/per-boot/n.sh
/var/lib/cloud/scripts/per-boot/n.sh
