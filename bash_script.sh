#! /bin/bash

#Unmark 'set -e' in case it's necessary to stop script when error occurs.
#set -e

#Defining log file.
log=cromai.log

# create log file or overrite if already present
printf "Log File - " > $log

err_report() {
    date >> $log
    echo "bash_script.sh: Error on line $1" >> $log
}

#With function trap we create a signal that runs the function err_report when the ERR event occurs.
trap 'err_report $LINENO' ERR

#Finding pid path with variable $pwd.
FILE="$(pwd)/pid"
while true
do
    #Checking if pid file exists, if it exists, read.
    if [ -f "$FILE" ]; then
        read -r pid<$FILE
        if ps -p $pid > /dev/null; 
        then
            # Do something knowing the pid exists, i.e. the process with $PID is running.
            echo 1: It is alive
            sleep 1
            continue
        fi
    fi
    #In case file doesn't exists or pid isn't running in system it executes python code.
    echo 1: It is dead
    python3 python_script.py &
    sleep 1
done