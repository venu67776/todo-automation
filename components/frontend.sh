#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Installing Npm"
apt install npm -y  &>>$LOG
Stat $?

Head "Update Nginx Configuration"
cd /etc/nginx/sites-enabled
sed -i 's|/var/www/html|/var/www/html/frontend|g' /etc/nginx/sites-enabled/default
cd /var/www/html

DOWNLOAD_COMPONENT 

Head "Update Nginx Configuration"

