#!/bin/bash
for comp in redis,todo,users,login.frontend

sshpass -p 'DevOps321' ssh ubuntu@$comp.venu6766.tk  "sudo git clone https://github.com/venu67776/todo-automation.git && cd todo-automation && sudo bash todoapp.sh $comp"

done