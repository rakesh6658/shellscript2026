#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
echo "please run with sudo access"
exit 1
fi

validate() {
if [ $1 -ne 0 ]; then
echo " ${2} failure"
exit 1
else
echo " ${2} success"
fi

}
echo "proceeding"

dnf install mysqll -y 
validate $? "mysql installation"

dnf install java -y
validate $? "java installation"