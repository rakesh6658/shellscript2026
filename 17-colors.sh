#!/bin/bash

logs_dir="/var/log/shellscript"
log_file="${logs_dir}/$0.log"
R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m" # no color reset
userid=$(id -u)

if [ $userid -ne 0 ]; then
echo -e "${R}please run with sudo access${N}"
exit 1
fi

validate() {
if [ $1 -ne 0 ]; then
echo -e " ${R} ${2} failure ${N}" | tee -a $log_file
exit 1
else
echo -e  "${G} ${2} success ${N}" | tee -a $log_file
fi

}
mkdir -p $logs_dir
echo "script started execution at $(date +"%m-%d-%Y_%H-%M-%S")"

for package in $@
do
dnf list installed $package  &>> $log_file
if [ $? -ne 0 ]; then
echo "installing package :$package" | tee -a $log_file
dnf install $package -y &>> $log_file
validate $? "${package} installation"
else
echo -e "${Y} ${package} alredy installed $N" 
fi
done

echo "script completed execution at $(date +"%m-%d-%Y_%H-%M-%S")"