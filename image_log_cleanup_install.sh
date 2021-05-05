#!/bin/bash
echo -e "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/novus:${PWD}
0 0 * * 0 root ${PWD}/image_log_cleanup.sh > /dev/null 2>&1" > /etc/cron.d/imglogcleanup