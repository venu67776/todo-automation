#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Install nodejs and npm"
apt install nodejs -y
apt install npm -y
Stat $?

DOWNLOAD_COMPONENT

Head "Unzip Downloaded Archive"
cd /var/www/html &&rm -rf vue && mkdir vue && cd vue && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip  && rm -rf frontend && mv frontend-main frontend && cd frontend
Stat $?

Head "Update Nginx Configuration"
cd /etc/nginx/sites-enabled
sed -i 's|/var/www/html|/var/www/html/vue/frontend/dist|g' /etc/nginx/sites-enabled/default
Stat $?

Head "update frontend configuration"
cd /var/www/html/vue/frontend  && npm install && npm run build && npm start