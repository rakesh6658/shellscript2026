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



for package in $@
do
dnf list installed "${package}" &>>$log_file
if [ $? -ne 0 ]; then

echo "Going to install: ${package}"
 dnf install $package -y &>> $log_file
  validate $?  "${package} installation"
else
echo "already installed ${package}"
fi

  done
 echo " script completed execution at $(date +"%F %T")" &>> $log_file

 
