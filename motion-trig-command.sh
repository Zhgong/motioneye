#!/bin/bash

LOGFILE=$0.log
exec 1>>${LOGFILE}
exec 2>&1

echo "----- Motion -------"
date

source $(dirname $0)/.env-bash # use this file to transfer enviroment variables otherwise it will not work if this script was called by system

curl -X POST -H "Content-Type: application/json" -u "${MESSAGE_TOKEN}:" -d '{"message":"[Mailbox] [有信件]"}' -k https://${SERVER_IP}:${PORT}/api/v1/send
