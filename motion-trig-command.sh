#!/bin/bash

LOGFILE=$0.log
echo "----- Motion -------" >> ${LOGFILE}
date >> ${LOGFILE}

source $(dirname $0)/.env-bash # use this file to transfer enviroment variables otherwise it will not work if this script was called by system

curl -X POST -H "Content-Type: application/json" -u "${MESSAGE_TOKEN}:" -d '{"message":"[Mailbox] [有信件]"}' -k https://${SERVER_IP}:${PORT}/api/v1/send >> ${LOGFILE} 2>&1
