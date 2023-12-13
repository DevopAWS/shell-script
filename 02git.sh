#!/bin/bash

ID=($id -u)

TIMESTAMP=$(date +%F)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script is excuting at $TIMESTAMP " &>> $LOGFILE 

VALIDATE(){

if [ $1 -ne 0 ];then
    echo -e "error::$2....$R FAILURE..$N"
    exit 1
        else
            echo -e "$2...$G SUCCESS..$N"
fi
}

if [ $ID -ne 0 ];then
    echo "ERROR::script is run with root user"
    exit 1
        else
            echo "you r root user"
fi

yum install git -y  &>> $LOGFILE
VALIDATE $? "git installed is"

yum install mysql -y  &>> $LOGFILE
VALIDATE $? "mysql inslled is" 

