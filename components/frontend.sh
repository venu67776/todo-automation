#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Unzip Downloaded Archive"
cd /var/www/html && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip  && rm -rf frontend && mv frontend-main frontend && cd frontend
Stat $?

Head "Update Nginx Configuration"
cd /etc/nginx/sites-enabled
sed -i 's|/var/www/html|/var/www/html/frontend/dist|g' /etc/nginx/sites-enabled/default
Stat $?

Head "Install nodejs and npm"
apt install nodejs -y
apt install npm -y
Stat $?

Head "update frontend configuration"
cd /var/www/html/frontend  && npm install && npm run build && npm start 

Head "Restart Nginx Service"
systemctl restart nginx
Stat $?