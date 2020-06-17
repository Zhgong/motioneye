#!/bin/bash
FILE=$(basename "$0") # get base name from absolute path
LOGFILE=/var/log/$FILE.log
exec 1>>"${LOGFILE}"
exec 2>&1

echo [$(date)] start Script to check netork connection

network_status=0
network_status_old=0
count=0
send_mode=0 # 0: send once (after bootup), 1: in loop

function send_message() {
	source "$(dirname $0)/.env-bash" # use this file to transfer enviroment variables otherwise it will not work if this script was called by system

	curl -X POST -H "Content-Type: application/json" -u "${MESSAGE_TOKEN}:" -d "{\"message\":\"[Mailbox] [$1]\"}" -k https://${SERVER_IP}:${PORT}/api/v1/send
}

while true; do
	ping -c 2 8.8.8.8 >/dev/null
	result=$?
	if [ ${result} -eq 0 ]; then
		network_status=1
	else
		network_status=0

	fi

	if [ ${network_status} -eq 1 ] && [ ${network_status_old} -eq 0 ]; then
		echo ["$(date)"] [Network OK]
		if [ ${count} -eq 0 ]; then
			name=$(hostname)
			ip=$(hostname -I | cut -d' ' -f1)
			send_message "[${name} Network ok. http://${ip}:8765] "
		elif [ ${send_mode} -eq 1 ]; then
			send_message "Network ok"
		fi
		count=$((count + 1))
		echo Network reconnect count: ${count}
	fi

	# echo network_status: ${network_status}
	# echo network_status_old: ${network_status_old}

	network_status_old=${network_status}
	sleep 5

done
