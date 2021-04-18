#!/bin/bash
apt-get install -y cloud-utils
growpart /dev/mmcblk0 1
resize2fs /dev/mmcblk0p1
echo "[+] SD Card data partition extended to the max"