#!/bin/bash

ID=($id -u)

TIMESTAMP=$(date +%F)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "excuting scrpit start $TIMESTAMP"  &>> $LOGFILE

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2....$R FAILURE.. $N"
            exit 1
            else 
                echo -e "$2....$G SUCCESS.. $N"
    fi
}


if [ $id -ne 0 ]; then
    echo "ERROR::script excuting with root user"
        exit 1
             else
                echo "yor are root user"
    fi





yum update -y &>> $LOGFILE

VALIDATE $? "yum update is.."

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo &>> $LOGFILE

    VALIDATE $? "repo is "

    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key  &>> $LOGFILE

    VALIDATE $? "importing package is "

    amazon-linux-extras install epel -y &>> $LOGFILE

    VALIDATE $? "amazaon package is "

    amazon-linux-extras install java-openjdk11 -y  &>> $LOGFILE

    VALIDATE $? "java install is "

    yum install jenkins -y &>> $LOGFILE

    VALIDATE $? "jenkin install is"

    systemctl enable jenkins &>> $LOGFILE

    VALIDATE $? "jenkin enable is"

    systemctl start jenkins &>> $LOGFILE

    VALIDATE $? "jenkin start" 

    systemctl status jenkins &>> $LOGFILE

    VALIDATE $? "jenkin status is"
