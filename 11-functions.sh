#!/bin/bash

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2... Failure"
        exit 1
    else
        echo "$2.. Success"
    fi

}

USERID=$(id -u)
 if [ $USERID -ne 0 ]
 then
    echo "Error:: you must have sudo access to execute this script"
    exit 1 # other than 0
fi   

dnf list installed mysql
if [ $? -ne 0 ] 
then # not insatlled
    dnf install mysql -y
    VALIDATE $? "Installing.."
 else
    echo "mySql is already installed"
 fi    
   
dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install git -y
     VALIDATE $? "Installing.."
 
else
    echo "git is already installed"
fi
