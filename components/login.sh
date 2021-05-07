#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Update Login "
cd Login
export GOPATH=/go
go get
go build
./Login
Stat $?
