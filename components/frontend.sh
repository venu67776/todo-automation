#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Installing Npm"
apt install npm -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Unzip Downloaded Archive"
cd /var/www && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip && mv frontend-main frontend && cd frontend
Stat $?



Head "Restart Nginx Service"
systemctl restart nginx
Stat $?