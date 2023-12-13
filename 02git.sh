#!/bin/bash

ID=($id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){

if [ $1 -ne 0 ];then
    echo "error::$2....${R}failure..${N}"
    exit 1
        else
            echo "$2...${G}success..${N}"
fi
}

if [ $ID -ne 0 ];then
    echo "ERROR::script is run with root user"
    exit 1
        else
            echo "you r root user"
fi

yum install git -y
VALIDATE $? "git installed is"

yum install mysql -y
VALIDATE $? "mysql inslled is" 

