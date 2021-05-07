#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /root && rm -rf login && unzip -o /tmp/login.zip &>>$LOG && mv login-main login && cd /root/login && export GOPATH=/go && go build &&chown ubuntu:ubuntu /home/ubuntu -R
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/user_endpoint/login.venu6776.tk/" /root/login/systemd.service
Stat $?


Head "Setup SystemD Service"
mv /root/login/systemd.service /etc/systemd/system/login.service && systemctl daemon-reload && systemctl start login && systemctl enable login &>>$LOG
Stat $?

