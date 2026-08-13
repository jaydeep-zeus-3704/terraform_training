#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
mkdir -p /var/www/html
echo "<h1>Terraform - Devops</h1>" > /var/www/html/index.html