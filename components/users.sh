#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install java"
sudo apt-get install openjdk-8-jdk
Stat $?

Head "Install maven"
apt install maven -y &>>$LOG
Stat $?


DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf users && unzip -o /tmp/users.zip &>>$LOG && mv users-main users  && cd users && mvn clean package &>>$LOG && mv target/users-api-0.0.1.jar users.jar
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/user_endpoint/login.venu6776.tk/" /home/ubuntu/users/systemd.service
Stat $?


Head "Setup SystemD Service"
mv /home/ubuntu/users/systemd.service /etc/systemd/system/users.service && systemctl daemon-reload && systemctl start users && systemctl enable users &>>$LOG
Stat $?

