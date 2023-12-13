#!/bin/bash



ID=($id -u)

if [ $ID -ne 0];then
    echo "ERROR::script is run with root user"
    exit 1
        else
            echo "you r root user"
fi

yum install git -y

if [ $ID -ne 0 ];then
    echo "git installed failure.."
    exit 1
        else
            echo "git installed success"
fi
