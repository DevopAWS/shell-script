#!/bin/bash

ID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ];then
    echo "Error::$2... FAILURE"
    exit 1
        else 
        echo "$2.....SUCCESS"
fi
}

if [ $ID -ne 0 ];then
    echo "ERROR::please run the script root user"
    exit 1
        else
            echo "you are root user"
fi

yum install mysql -y
VALIDATE $? "installing mysql is"



