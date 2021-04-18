#!/bin/bash

SERVICE_PATH="/lib/systemd/system"
SERVICE_FILE="novus.service"


if (cp "./$SERVICE_FILE" "$SERVICE_PATH"); then
	echo "[+] Successfully copied $SERVICE_FILE to $SERVICE_PATH"
    if (systemctl daemon-reload); then
        systemctl enable $SERVICE_FILE
        systemctl start $SERVICE_FILE
    else
	    echo "[!] Reloading systemd manager configuration failed"
	    exit 1
    fi
fi
exit 0




