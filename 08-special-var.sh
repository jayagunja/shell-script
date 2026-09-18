# !/bin/bash

echo "All variables passed: $@"
echo "number of variables : $#"
echo "script name : $0"
echo "present working directory : $PWD" 
echo "home directroy of current  user :$HOME" 
echo "which user is running this script : $USER" 
echo "process id of current script : $$"
sleep 60 &
#& denotes to moving foreground to backend running process
echo "process id of last command in background : $!"





