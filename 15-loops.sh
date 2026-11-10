#!/bin/bash

logs_dir="/var/log/shellscript"
log_file="${logs_dir}/$0.log"

userid=$(id -u)

if [ $userid -ne 0 ]; then
echo "please run with sudo access"
exit 1
fi

validate() {
if [ $1 -ne 0 ]; then
echo " ${2} failure" | tee -a $log_file
exit 1
else
echo " ${2} success" | tee -a $log_file
fi

}
mkdir -p $logs_dir
echo "script started execution at $(date +"%m-%d-%Y_%H-%M-%S")"

for package in $@
do
echo "installing package :$package" | tee -a $log_file
dnf install $package -y &>> $log_file
validate $? "${package} installation"
done

echo "script completed execution at $(date +"%m-%d-%Y_%H-%M-%S")"