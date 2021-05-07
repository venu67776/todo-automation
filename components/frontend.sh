#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Update Nginx Configuration"
cd /etc/nginx/sites-enabled
sed -i 's|/var/www/html|/var/www/html/frontend/dist|g' /etc/nginx/sites-enabled/default
cd /var/www/html
Stat $?

DOWNLOAD_COMPONENT 

Head "Install npm and start npm service"
cd frontend
apt install npm -y &>>$LOG
npm install 
npm run build 
npm start 
Stat $?

Head "Restart Nginx service"
systemctl restart nginx


