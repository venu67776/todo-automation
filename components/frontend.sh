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

Head "Installing nodejs & Npm"
 apt install nodejs -y
 apt-get install npm -y
 Stat $?

Head "update Frontend Configuration"
cd /var/www/html/frontend && npm install  && npm run build && npm start &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s//cart.zsdevops01.online/" -e "s/USERHOST/user.zsdevops01.online/" -e "s/AMQPHOST/rabbitmq.zsdevops01.online/" /home/roboshop/payment/systemd.service
Stat $?

Head "Restart Nginx Service"
systemctl restart nginx
Stat $?