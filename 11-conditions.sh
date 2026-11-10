#!bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
 echo "Execute with sudo access"
 exit 1
 fi
echo " proceeding"
 dnf install nginx -y

 if [ $? -ne 0 ];  then
 echo "nginx installation falure"
 exit 1
 else
  echo "nginx installation success"
fi

 dnf install maven -y

 if [ $? -ne 0 ]; then
 echo "maven installation falure"
 exit 1
 else
  echo "maven installation success"
fi
echo "Still proceeded..."