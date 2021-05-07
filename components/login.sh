#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf login && unzip -o /tmp/login.zip &>>$LOG && mv login-main login && cd /home/ubuntu/login && export GOPATH=/go && go get &>>$LOG && go build
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/CARTENDPOINT/cart.zsdevops01.online/" -e "s/DBHOST/mysql.zsdevops01.online/" /home/ubuntu/login/systemd.service
Stat $?


Head "Setup SystemD Service"
mv /home/ubuntu/login/systemd.service /etc/systemd/system/login.service && systemctl daemon-reload && systemctl start shipping && systemctl enable shipping &>>$LOG
Stat $?

