#!/bin/bash

USERID=($id -u)

TIMESTAMP=$(date +%F)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ];then
        echo -e "$2....$R FAILURE $N"
        exit 1
            else
            echo -e"$2..$R SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ];then
    echo -e "$R excuting script with root user $N"
    exit 1
        else
            echo -e "$Y you are root user $N"
fi

for package in $@
do

yum list install $package

done



