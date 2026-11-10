#!/bin/bash

logs_dir="/var/log/shell-practice"
log_file="${logs_dir}/${0}.log"

userid=$(id -u)

if [ $userid -ne 0 ]; then
 echo "Execute with sudo access"
 exit 1
 fi

 echo " script started execution at $(date +"%F %T")" &>> $log_file
mkdir -p $logs_dir
validate(){
    if [ $1 -ne 0 ]; then
    echo "$2 ... failure" | tee -a $log_file
    exit 1
    else
    echo "$2 ... success" | tee -a $log_file
    fi
}
 dnf install nginx -y &>> $log_file
 validate $?  "nginx installation"

dnf install maven -y &>> $log_file
validate $? " maven installation"
 echo " script completed execution at $(date +"%F %T")" &>> $log_file

 
