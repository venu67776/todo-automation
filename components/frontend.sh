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
sed -i -e "s//root/var/www/html //root/var/www/html/frontend/dist/" /root/etc/nginx/sites-enabled/default

DOWNLOAD_COMPONENT 

Head "Update Nginx Configuration"








