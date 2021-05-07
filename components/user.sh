#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing java"
sudo apt install openjdk-8-jdk 
Stat $?

Head "Installing maven"
apt install maven -y &>>$LOG
Stat $?


DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf users && unzip -o /tmp/users.zip &>>$LOG && mv users-main users  && cd /home/ubuntu/users && mvn clean package &>>$LOG 
Stat $?

