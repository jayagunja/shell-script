#!/bin/bash

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
    if [ $? -ne 0 ]
    then
        echo "installing MySQL... Failure"
        exit 1
    else
        echo "installing mySQL... Success"
    fi
 else
    echo "mySql is already installed"
 fi    
   
    

# if [ $? -ne 0 ]
# then
#     echo "installing MySQL... Failure"
#     exit 1
# else
#     echo "installing mySQL... Success"
# fi


dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install git -y

    if [ $? -ne 0 ]
    then
        echo "installing git.... Failure"
        exit 1
    else
        echo "installing git... Success"
    fi

else
    echo "git is already installed"
fi

# dnf install git -y

# if [ $? -ne 0 ]
# then
#     echo "installing git.... Failure"
#     exit 1
# else
#     echo "installing git... Success"
# fi