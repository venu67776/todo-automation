#!/bin/bash
sudo su
cd ~

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
