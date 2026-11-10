#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
echo "please run with sudo access"
exit 1
fi
echo "proceeding"

dnf install mysqll -y 

if [ $? -ne 0 ]; then
echo " mysql installation failure"
exit 1
else
echo " mysql installation success"
fi
dnf install javaa -y

if [ $? -ne 0 ]; then
echo " java installation failure"
exit 1
else
echo " java installation success"
fi
