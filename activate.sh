#!/bin/bash
chmod +x *sh
if [ -e key.pem ]; then
	chmod 600 key.pem
    echo "Starting..."
    ./generate_keys.sh
    sudo ./timezone.sh
    sudo ./sd_resize.sh
    sudo ./reboot.sh
    sudo ./remote_tunnel.sh
    sudo ./novus.sh
    sudo ./disable_apt_upgrade.sh
    sudo ./ntp.sh
    sudo ./ufw.sh
    sudo ./image_log_cleanup_install.sh
    sudo ./connectivity_install.sh
else
	echo "[x] key not found"
fi

