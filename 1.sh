#! /bin/bash
DOMAIN="venu6766.tk"
PASSWORD="DevOps321"

for component in redis todo users login frontend ; do

   sshpass -p ${PASSWORD}  ssh ubuntu@$component.${DOMAIN} "git clone https://github.com/venu67776/Todo-automation.git ; cd Todo-automation ; sudo bash Todo.sh ${component}"

done
