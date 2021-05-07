#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf login && unzip -o /tmp/login.zip &>>$LOG && mv login-main login && cd /home/ubuntu/login && export GOPATH=/go && go build
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/user_endpoint/login.venu6776.tk/" /home/ubuntu/login/systemd.service
Stat $?




