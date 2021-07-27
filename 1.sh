#! /bin/bash

for component in redis todo users login frontend ; do

   sshpass -p 'DevOps321' ssh ubuntu@${component}.venu6766.tk "git clone https://github.com/venu67776/todo-automation.git ; cd todo-automation ; sudo bash Todoapp.sh ${component}"

done