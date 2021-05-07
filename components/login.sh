#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Update Login "
cd login
export GOPATH=/go
go get &>>$LOG
go build
Stat $?

Head "Setup SystemD Service"
mv /home/ubuntu/login/systemd.service /etc/systemd/system/login.service && systemctl daemon-reload && systemctl start cart && systemctl enable cart &>>$LOG
Stat $?
