#!/bin/bash
echo -e "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/novus:/home/novus/novus_scripts
0 0 * * 0 root /home/novus/novus_scripts/image_log_cleanup.sh > /dev/null 2>&1" > /etc/cron.d/imglogcleanup
