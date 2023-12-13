#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ];then
    echo "ERROR::please run the script root user"
    exit 1
        else
            echo "you are not root user"
fi

yum install mysql -y

