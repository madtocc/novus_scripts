#!/bin/bash
LOG_FILE="/home/novus/.connection.log"
if ifconfig -a wwan0 | grep "inet "> /dev/null;then
	echo $(date) OK >> $LOG_FILE
else
	echo $(date) NOT CONNECTED >> $LOG_FILE
	echo "trying to reconnect..." >> $LOG_FILE	
	systemctl restart simcom_wwan@wwan0.service
	systemctl restart remote-tunnel.service 
fi
