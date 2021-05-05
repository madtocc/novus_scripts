#!/bin/bash
echo -e "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/novus:${PWD}
*/1 * * * * root ${PWD}/connectivity.sh > /dev/null 2>&1" > /etc/cron.d/connection