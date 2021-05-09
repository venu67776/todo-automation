#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
systemctl restart nginx 
Stat $?

Head "Install nodejs and npm"
apt install npm -y
Stat $?

Head "Update Nginx Configuration"
cd /etc/nginx/sites-enabled
sed -i 's|/var/www/html|/var/www/html/vue/frontend/dist|g' /etc/nginx/sites-enabled/default
Stat $?

DOWNLOAD_COMPONENT

Head "Unzip Downloaded Archive"
cd /var/www/html &&rm -rf vue && mkdir vue && cd vue && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip  && rm -rf frontend && mv frontend-main frontend && cd frontend
Stat $?

Head "update frontend configuration"
cd /var/www/html/vue/frontend  && sudo npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass && npm run build && npm start
 
Head "update end points in service file"
cd /var/www/html/vue/frontend/config
export AUTH_API_ADDRESS=http://login.venu6766.tk:8080
export TODOS_API_ADDRESS=http://todos.venu6766.tk:8080

Head "Restart the Nginx service"
 systemctl restart nginx
 Stat $?