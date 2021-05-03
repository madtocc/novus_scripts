#!/bin/bash
IMG_FOLDER="$HOME/app/logs/img"
find $IMG_FOLDER -type f -mtime +7 -name '*.jpg' -execdir rm -- '{}' \;