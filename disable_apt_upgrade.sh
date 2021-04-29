#!/bin/bash

systemctl mask apt-daily.service
systemctl mask apt-daily.timer
systemctl mask apt-daily-upgrade.service
systemctl mask apt-daily-upgrade.timer
sed -i -e 's/Update-Package-Lists "1"/Update-Package-Lists "0"/g' -e 's/Unattended-Upgrade "1"/Unattended-Upgrade "0"/g' /etc/apt/apt.conf.d/20auto-upgrades