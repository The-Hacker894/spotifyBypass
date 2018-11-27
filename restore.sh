#!/bin/sh

	hostBackupPath="hosts.bak"

    hostBackup=`cat hosts.bak`

	currentDir=`${PWD##*/}`
	
	dataToAppend=`cat bypassData.txt`

	originalHostPath="/etc/hosts"

	originalHost=`cat /etc/hosts`

	RED='\033[0;31m'
	WHITE='\033[1;37m'

clear
    echo "${WHITE}Spotify Bypass ${RED}Restore${WHITE} Script"
read -r -p "The Spotify Bypass script modifies your ${originalHostPath} file. Are you sure you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
    if [ -f "$hostBackupPath" ] 
        then
            echo "${hostBackupPath} path has been found."
                    if [ -r "$hostBackupPath" ] 
                        then
                            if [ -w "$originalHostPath" ]
                            
                            then
                            echo "$originalHostPath is writeable"
                            echo "Modifying ${originalHostPath}"
                            echo ${hostBackup} > "${originalHostPath}"
                            echo "$hostBackupPath has been restored to $originalHostPath"
                            else
                            echo "$originalHostPath is not writeable. Try using sudo"
                            fi
                            
                        else
                            echo "${hostBackupPath} is not readable. Try using sudo"
                        fi
        else    
            echo "${hostBackupPath} path was not found."
        fi
 ;;
    *)
        echo "End"
        ;;
esac