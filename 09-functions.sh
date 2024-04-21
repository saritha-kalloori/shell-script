#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPT_NAME=$($0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0] 
    then

    echo "$2...failure"
    exit 1
    else 
    echo "$2...success"
    fi
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