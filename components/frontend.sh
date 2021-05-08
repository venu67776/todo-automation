#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Installing Npm"
apt install npm -y &>>$LOG

DOWNLOAD_COMPONENT

Head "Remove Default Configuration"
rm -rf /var/www/html /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
Stat $?

Head "Unzip Downloaded Archive"
cd /var/www && unzip -o /tmp/frontend.zip &>>$LOG && mv frontend-main/* . && mv static html && rm -rf frontend-main README.md
Stat $?

