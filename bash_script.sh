#! /bin/bash

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