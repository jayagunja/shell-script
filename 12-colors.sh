#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R Failure"
        exit 1
    else
        echo -e "$2.. $G Success"
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
    echo -e "mySql is already $G installed"
 fi    
   
dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install git -y
     VALIDATE $? "Installing.."
 
else
    echo -e "git is already $G installed"
fi
