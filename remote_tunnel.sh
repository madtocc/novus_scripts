#!/bin/bash

SERVICE_PATH="/lib/systemd/system"
SERVICE_FILE="remote-tunnel.service"

# dpkg-reconfigure --frontend=noninteractive openssh-server

if (cp "./$SERVICE_FILE" "$SERVICE_PATH"); then
	echo "[+] Successfully copied $SERVICE_FILE to $SERVICE_PATH"
    # write the port to the service
    if (systemctl daemon-reload); then
        echo "[] enabling remote tunnel service"
        systemctl enable $SERVICE_FILE
        systemctl start $SERVICE_FILE
        echo "[+] remote tunnel service enabled"
    else
	    echo "[!] Reloading systemd manager configuration failed"
	    exit 1
    fi
fi
exit 0




