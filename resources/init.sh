#!/bin/bash
#Installing Docker
sudo yum update -y
sudo yum install -y git docker 
sudo service docker start
sudo usermod -a -G docker ec2-user
docker run --name docker-nginx -p 80:80 -d nginx:latest
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m) -o /usr/bin/docker-compose
sudo chmod 755 /usr/bin/docker-compose
git clone https://github.com/DanielDucuara2018/report_calculation.git /home/ec2-user/report_calculation
git clone https://github.com/DanielDucuara2018/report_calculation_front.git /home/ec2-user/report_calculation_front