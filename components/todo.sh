#!/bin/bash

source components/common.sh

OS_PREREQ


Head "Installing npm"
apt install npm -y &>>$LOG
Stat $?


DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf todo && unzip -o /tmp/todo.zip &>>$LOG && mv todo-main todo  && cd todo && npm install &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/user_endpoint/login.venu6776.tk/" /home/ubuntu/todo/systemd.service
Stat $?


Head "Setup SystemD Service"
mv /home/ubuntu/todo/systemd.service /etc/systemd/system/todo.service && systemctl daemon-reload && systemctl start todo && systemctl enable todo &>>$LOG
Stat $?