apt install ntpdate
ntpdate -dv ntp.ubuntu.com  
timedatectl set-timezone UTCzdata
systemctl restart systemd-timesyncd