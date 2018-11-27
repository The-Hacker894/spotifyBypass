#!/bin/sh

	hostBackup="host.bak"

	currentDir=`${PWD##*/}`
	
	dataToAppend=`cat bypassData.txt`

	originalHostPath="/etc/host"

	originalHost=`cat /etc/host` 

clear

## read -r -p "The Spotify Bypass script modifies your ${originalHostPath} file. Are you sure you want to continue? [y/N] " response
## case "$response" in
 ##   [yY][eE][sS]|[yY]) 
##
##        ;;
##    *)
##        ;;
##    esac

## Should probably check to see if the file exists before trying to back it up (can't copy something from nothing)

## Overwrite >
## Append >>


read -r -p "The Spotify Bypass script modifies your ${originalHostPath} file. Are you sure you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo "Backing up host file"

        echo "$originalHost" > "$hostBackup"
        echo "Your host has been backed up to $hostBackup"

        if [ -f "$originalHostPath" ] 
        then
            echo "e"
            if [ -r "$originalHostPath" ]
            then
                ## Host File is readable
                echo "Host File is readable"
                if [ -w "$originalHostPath" ]
                then    
                    ## Host File is writeable
                    ## Host File modification begins here
                   echo "Host File is writeable"
                else
                    echo "Your ${originalHostPath} file is not writeable. Try using sudo"
                    exit
                fi
            else
                echo "Your ${originalHostPath} file is not readable. Try using sudo"
                exit
            fi
        else
            echo "Your ${originalHostPath} file was not found"
            exit
        fi

        ;;
    *)
        echo "n"
        ;;
esac