#!/bin/bash
echo -e "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/novus:/home/novus/novus_scripts
*/1 * * * * root /home/novus/novus_scripts/connectivity.sh > /dev/null 2>&1" > /etc/cron.d/connection
