#!/bin/bash

sshpass -p 'DevOps321' ssh ubuntu@redis.venu6766.tk  "sudo git clone https://github.com/venu67776/todo-automation.git && cd todo-automation && sudo bash todoapp.sh redis"
sshpass -p 'DevOps321' ssh ubuntu@todo.venu6766.tk  "sudo git clone https://github.com/venu67776/todo-automation.git && cd todo-automation && sudo bash todoapp.sh todo"
sshpass -p 'DevOps321' ssh ubuntu@users.venu6766.tk  "sudo git clone https://github.com/venu67776/todo-automation.git && cd todo-automation && sudo bash todoapp.sh users"
sshpass -p 'DevOps321' ssh ubuntu@login.venu6766.tk  "sudo git clone https://github.com/venu67776/todo-automation.git && cd todo-automation && sudo bash todoapp.sh login"
sshpass -p 'DevOps321' ssh ubuntu@frontend.venu6766.tk  "sudo git clone https://github.com/venu67776/todo-automation.git && cd todo-automation && sudo bash todoapp.sh frontend"