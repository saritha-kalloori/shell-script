#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status: $1"
    echo "what are you doing: $2"
}


if [ $USERID -ne 0 ]
then

  echo "please run this script with root access"
  exit 1
else
   echo "you are the super user"
fi

 dnf install mysql -y
 VALIDATE $? "install mysql"

dnf install git -y
VALIDATE $?  "install git"