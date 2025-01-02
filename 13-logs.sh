#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R Failure $N"
        exit 1
    else
        echo -e "$2.. $G Success $N"
    fi

}

USERID=$(id -u)
 if [ $USERID -ne 0 ]
 then
    echo "Error:: you must have sudo access to execute this script" &>>$LOG_FILE_NAME
    exit 1 # other than 0
fi   

dnf list installed mysql  &>>$LOG_FILE_NAME
if [ $? -ne 0 ] 
then # not insatlled
    dnf install mysql -y  &>>$LOG_FILE_NAME
    VALIDATE $? "Installing.."
 else
    echo -e "mySql is already $G installed $N"
 fi    
   
dnf list installed mysql  &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y  &>>$LOG_FILE_NAME
     VALIDATE $? "Installing.."
 
else
    echo -e "git is already $G installed $N"
fi
