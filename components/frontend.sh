#!/bin/bash

source components/common.sh

DOMAIN="venu6766.tk"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
systemctl restart nginx 
Stat $?

Head "Install npm"
apt install npm -y &>>$LOG
Stat $?

Head "Update Nginx Configuration"
sed -i 's|/var/www/html|/var/www/html/vue/frontend/dist|g' /etc/nginx/sites-enabled/default
Stat $?

DOWNLOAD_COMPONENT

Head "Unzip Downloaded Archive"
cd /var/www/html && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip  && rm -rf frontend && mv frontend-main frontend && cd frontend
Stat $?

Head "update frontend configuration"
cd /var/www/html/frontend  && sudo npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass &>>$LOG && npm run build &>>$LOG 
Stat $?

Head "Update Nginx Configuration"
mv todo.conf /etc/nginx/sites-enabled/todo.conf
done
Stat $?

Head "Restart Nginx Service"
systemctl restart nginx
Stat $?
