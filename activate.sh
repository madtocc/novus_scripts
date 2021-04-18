#!/bin/bash
chmod +x *sh
if [ -e key.pem ]; then
	chmod 600 key.pem
    echo "Starting..."
    ./generate_keys.sh
    sudo ./timezone.sh
    sudo ./sd_resize.sh
    sudo ./reboot.sh
    sudo ./remote-tunnel.sh
    sudo ./ufw.sh
    sudo ./novus.sh
else
	echo "[x] key not found"
fi

