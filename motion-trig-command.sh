#!/bin/bash

LOGFILE=$0.log
echo "----- Motion -------" >> ${LOGFILE}

source /home/pi/motioneye/.env-bash # use this file to transfer enviroment variables otherwise it will not work if this script was called by system

echo PWD:$(pwd)

date >> ${LOGFILE}
echo Running as $USER >> ${LOGFILE}
whoami  >> ${LOGFILE}
echo ENV: >> ${LOGFILE}
env >> ${LOGFILE}
export PATH=$PATH:"/home/pi/.local/bin"
echo $PATH >> ${LOGFILE}
send-bot "[Mailbox] [有信件]" >> $0.log 2>&1
