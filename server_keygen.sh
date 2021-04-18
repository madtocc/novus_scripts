#!/bin/bash
SSH_DIR="/$HOME/.nano_ssh"
if [[ ! -d "$SSH_DIR" ]]; then
    mkdir "$SSH_DIR"
fi
echo $SSH_DIR/$1
if [ ! -f "$SSH_DIR/$1" ]; then
    yes | ssh-keygen -f $SSH_DIR/$1 -q -N ""
    pub_key=$(cat $SSH_DIR/$1.pub)
    echo $pub_key
fi