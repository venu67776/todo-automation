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

Head "changing path"
cd /var/www/html
sed -i 's|/var/www/html|/var/www/html/frontend|g /etc/nginx/sites-enabled/default

DOWNLOAD_COMPONENT 

Head "Update Nginx Configuration"