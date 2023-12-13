#!/bin/bash

USERID=$(id -u)

DATE=$(date +%F)

LOG="jenkin-install-${DATE}.log"

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


VALIDATE(){
if	[ $1 -ne 0 ];then
	echo -e "$2.....${R} FAILURE ${N}" 2>&1 | tee -a $LOG
	exit 1
		else
				echo -e "$2... ${G} SUCCESS ${N}" 2>&1 | tee -a $LOG

fi
}

if [ $USERID -ne 0 ]; then
	echo -e "${R} if you need to be root user excute this script ${N}"
	exit 1
    else 
    echo -e "$Y you are root user $N"
fi
	


yum update -y &>>$LOG

VALIDATE $? "yum install" 


wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo  &>>$LOG
	
	VALIDATE $? " install repo"
	
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>>$LOG

VALIDATE $? "package install"


amazon-linux-extras install java-openjdk11 -y &>>$LOG

VALIDATE $? "java install"

yum install jenkins -y &>>$LOG

VALIDATE $? "jenkins install"

systemctl enable jenkins &>>$LOG

VALIDATE $? "jenkins enable" 

systemctl start jenkins &>>$LOG

VALIDATE $? "jenkins start"

systemctl status jenkins &>>$LOG

VALIDATE $? "jenkins status"

lss -ltr &>>$LOG

VALIDATE $? "wrong meassge"