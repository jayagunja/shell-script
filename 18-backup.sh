#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #If user not providing number of days, We are taking 14 as default

SOURCE_DIR="/home/ec2-user/app-logs"
LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

 USAGE(){
    echo -e "$R USAGE:: $Y sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>" $N
    exit 1
 }

 mkdir -p $LOGS_FOLDER
 
if [ $# -lt 2 ]
 then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR Does not exist...Please check"
    exit 1
fi    

if [ ! -d $DEST_DIR ]
then
    echo -e "$DEST_DIR Does not exist...Please check"
    exit 1
fi  

 echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

 FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
 

 if [ -n "$FILES" ]
 then
    echo "files are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"

    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Successfully created zip file for older than $DAYS days" 
        while read -r eachfile
        do
            echo "Deleting eachfile: $eachfile"
            rm -rf $eachfile
        done <<< $FILES
    else
        echo -e "$R Error :: Failed to create ZIP file"$N
        exit 1
    fi    

else
    echo "No files found older than $DAYS days"
fi      
