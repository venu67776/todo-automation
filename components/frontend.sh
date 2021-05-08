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

Head "Remove Default Configuration"
rm -rf /var/www/html /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
Stat $?

Head "Unzip Downloaded Archive"
cd /var/www && unzip -o /tmp/frontend.zip &>>$LOG && mv frontend-main/* . && mv static html && rm -rf frontend-main README.md
Stat $?

Head "Update Nginx Configuration"
mv todp.conf /etc/nginx/sites-enabled/todo.conf
for comp in login todo ; do
  sed -i -e "/$comp/ s/localhost/${comp}.venu6776.tk/" /etc/nginx/sites-enabled/todo.conf
done
Stat $?

Head "Restart Nginx Service"
systemctl restart nginx
Stat $?