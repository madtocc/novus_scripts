#!/bin/bash
echo -e "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 3   *   *   *    /sbin/shutdown -r now" > /etc/cron.d/daily_reboot