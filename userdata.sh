#!/bin/bash
sudo apt update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx 
echo "<h1>Hello from $(hostname -f).This deployment is done from terraform script. </h1> " > /var/www/html/index.html
sudo apt install -y postgresql postgresql-contrib
sudo apt install -y postgresql-client