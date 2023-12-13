#!/bin/bash

ID=($id -u)

TIMESTAMP=$(date +%F)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"



VALIDATE(){
    if [ $1 -ne 0 ];then
        echo "$2....$R FAILURE $N"
            exit 1
            else 
                echo "$2....$G SUCCESS $N"

}

if [ $id -ne 0 ];then
    echo "ERROR::script excuting with root user"
        exit 1
             else
                echo "yor are root user"
    fi





yum update -y

VALIDATE $? "yum update is.."

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

    VALIDATE $? "repo is "

    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 

    VALIDATE $? "importing package is "

    amazon-linux-extras install java-openjdk11 -y

    VALIDATE $? "java install"

    yum install jenkins -y

    VALIDATE $? "jenkin install is"

    systemctl enable jenkins

    VALIDATE $? "jenkin enable is"

    systemctl start jenkins

    VALIDATE $? "jenkin start"

    systemctl status jenkins

    VALIDATE $? "jenkin status is"
