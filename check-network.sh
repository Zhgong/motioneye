#!/bin/bash
echo start Script to check netork connection

network_status=0
network_status_old=0

function send_message(){

	source $(dirname $0)/.env-bash # use this file to transfer enviroment variables otherwise it will not work if this script was called by system

	curl -X POST -H "Content-Type: application/json" -u "${MESSAGE_TOKEN}:" -d "{\"message\":\"[Mailbox] [$1]\"}" -k https://${SERVER_IP}:${PORT}/api/v1/send
}

while true;
do
	ping -c 2 8.8.8.8 > /dev/null
	result=$?
	if [ ${result} -eq 0 ];
	then
		network_status=1
	else
		network_status=0
	fi


	if [ ${network_status} -eq 1 ] && [ ${network_status_old} -eq 0 ]; 
	then
		echo [$(date)] [Network OK]
		send_message "Network ok"
	fi

	echo network_status: ${network_status}
	echo network_status_old: ${network_status_old}

	network_status_old=${network_status}
	sleep 5



done
