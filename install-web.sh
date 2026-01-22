#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello from private EC2 behind ALB" > /var/www/html/index.html
