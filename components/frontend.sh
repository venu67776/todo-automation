#!/bin/bash

source components/common.sh

DOMAIN="ansible.ga"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
systemctl restart nginx 
Stat $?

Head "Install npm"
apt install npm -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Remove Default Configuration"
rm -rf  /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
Stat $?

Head "Unzip Downloaded Archive"
cd /var/www/html && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip  && rm -rf frontend && mv frontend-main frontend && cd frontend
Stat $?

Head "update frontend configuration"
cd /var/www/html/frontend  && sudo npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass &>>$LOG && npm run build &>>$LOG 
Stat $?

Head "Update Nginx Configuration"
mv todo.conf /etc/nginx/sites-enabled/todo.conf
for comp in login todo ; do
  sed -i -e "/$comp/ s/localhost/${comp}.${DOMAIN}/" /etc/nginx/sites-enabled/todo.conf
done
Stat $?

Head "Restart Nginx Service"
systemctl restart nginx
Stat $?
