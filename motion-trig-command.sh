#!/bin/bash

LOGFILE=$0.log
exec 1>>${LOGFILE}
exec 2>&1

echo "----- Motion -------"
date

source $(dirname $0)/.env-bash # use this file to transfer enviroment variables otherwise it will not work if this script was called by system

i=1 
MAX_COUNT=100 
SLEEP_TIME=30
while [ $i -lt $MAX_COUNT ] 
do     
	echo "Send count: $i"
	curl -X POST -H "Content-Type: application/json" -u "${MESSAGE_TOKEN}:" -d "{\"message\":\"[$(date)] [Mailbox] [有信件]\"}" -k https://${SERVER_IP}:${PORT}/api/v1/send
	if [ $? -eq 0 ]     
	then         
		break     
	fi     
	i=$(($i+1))     
	sleep $SLEEP_TIME 
done
