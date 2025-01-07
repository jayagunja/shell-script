 
source ./common.sh

SOURCE_DIR="/home/ec2-user/app-logs"

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

 FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
 echo "Files to be deleted: $FILES_TO_DELETE"

 while read -r eachfile
 do
    echo "Deleting eachfile: $eachfile"
    rm -rf $eachfile
 done <<< $FILES_TO_DELETE



