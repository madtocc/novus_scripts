#!/bin/bash

if (dpkg -l ufw); then
    apt install -y ufw
fi
#Disable IPV6 in /etc/default/ufw
sed -i '7s/.*/IPV6=no/' /etc/default/ufw
ufw disable
ufw default deny outgoing
ufw default deny incoming
ufw allow out to any port 53
ufw allow ssh
ufw allow 8883
ufw allow out https
ufw allow out ssh
ufw allow out 8883
ufw enable


