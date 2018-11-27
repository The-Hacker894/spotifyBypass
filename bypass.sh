#!/bin/sh

	hostBackupPath="hosts"

    hostBackup="cat hosts"

	currentDir=`${PWD##*/}`
	
	dataToAppend=`cat bypassData.txt`

	originalHostPath="/etc/hosts"

	originalHost=`cat /etc/hosts`

	RED='\033[0;31m'
	WHITE='\033[1;37m'

    ver="v1"

clear

## read -r -p "${WHITE}The Spotify Bypass script modifies your ${originalHostPath} file. Are you sure you want to continue? [y/N] " response
## case "$response" in
 ##   [yY][eE][sS]|[yY]) 
##
##        ;;
##    *)
##        ;;
##    esac

## Overwrite >
## Append >>

echo "${WHITE}Spotify Bypass ${RED}Modify ${WHITE}Script"

if [[ $originalHost == *"ANON-${ver}"* ]]; then
  echo "${RED} ${originalHostPath} has already been patched.${WHITE}" 
  exit
fi

read -r -p "The Spotify Bypass script modifies your ${originalHostPath} file. Are you sure you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        clear
        echo "${WHITE}Backing up ${originalHostPath}"

	if [ -f "$originalHostPath" ] 
        then

	echo "${originalHostPath} has been found"
	    if [ -r "$originalHostPath" ]
            then
		## Host File is readable
	echo "${originalHostPath} is readable"
        if [ -f "$hostBackupPath" ]
            
        then
            rm -rf "${hostBackupPath}"
            cp -r "${originalHostPath}" "./"
        else
            cp -r "${originalHostPath}" "./"
        fi
        

      ##  echo "$originalHost" > "$hostBackupPath"
        echo "${originalHostPath} has been backed up to ${hostBackupPath}"
	echo "${RED}Do not delete ${hostBackupPath} as this is your only backup for ${originalHostPath}${WHITE}"
    echo "You can restore using the restore.sh script"

                if [ -w "$originalHostPath" ]
                then    
                    ## Host File is writeable
                    ## Host File modification begins here
                   echo "${originalHostPath} is writeable"
		   echo "Modifying ${originalHostPath}"
		   echo "$dataToAppend" >> "$originalHostPath"
		   echo "${originalHostPath} has been modified. If anything goes wrong use the restore script to revert back to your backup."
           echo "End"
                else
                    echo "${originalHostPath} file is not writeable. Try using sudo"
                    exit
                fi
            else
                echo "${originalHostPath} file is not readable. Try using sudo"
                exit
            fi
        else
            echo "${originalHostPath} file was not found"
            exit
        fi

        ;;
    *)
        echo "End"
        ;;
esac
