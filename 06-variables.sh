#!/bin/bash

# passing the arguments through prompt

echo " Enter your username"

read Username

echo " Enter your password"
# -s for without printing the output in terminal
read -s password

#checking the variable args
echo "username is $Username and password is $password"

