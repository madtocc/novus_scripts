#!/bin/bash
SERVICE_FILE="remote-tunnel.service"
SSH_DIR="/$HOME/.ssh"
LOCAL_SSH_REMOTE_SSH_AUTHORIZED="/$HOME/.ssh/authorized_keys"
REMOTE_SSH_AUTHORIZED_KEYS="/home/ec2-user/.ssh/authorized_keys"
REMOTE_SSH_KNOWN_HOSTS="/home/ec2-user/.ssh/known_hosts"
REMOTE_SSH_SCRIPT="/home/ec2-user/.scripts/keygen.sh"
REMOTE_SSH_NANO="/home/ec2-user/.nano_ssh/"
REMOTE_ADDRESS="ec2-user@54.254.184.217"

REMOTE_SCRIPTS_DIR="/home/ec2-user/.scripts"
if [[ -d "$SSH_DIR" ]]; then
    echo "[-] $SSH_DIR already exists"
else
    echo "[+] Creating directory $SSH_DIR"
    mkdir "$SSH_DIR"
fi
yes | ssh-keygen -f $SSH_DIR/id_rsa -q -N ""
pub_key=$(cat $SSH_DIR/id_rsa.pub)
echo -e '[+] SSH key generated \n'#$pub_key
# write pubkey to the authorized keys and get the last known host to extract the next port to be used
last_port_connected=`ssh -i key.pem $REMOTE_ADDRESS 'echo '$pub_key '>> '$REMOTE_SSH_AUTHORIZED_KEYS'; tail -1 '$REMOTE_SSH_KNOWN_HOSTS''`
last_port_connected_array=($last_port_connected)
last_port=${last_port_connected_array#*:}
next_port=$((last_port + 1))
if (( next_port<2222)); then
    echo "[x] Invalid port, something went wrong! Terminating..."
     exit 1
fi
echo '[+] Saved authorized key into the server and next port is '$next_port

server_pub_key=`ssh -i key.pem $REMOTE_ADDRESS $REMOTE_SSH_SCRIPT $next_port`
split_key=(${server_pub_key//ssh-rsa/})
if ((  ${#split_key[@]}>2)); then
    echo 'ssh-rsa '${split_key[1]} ${split_key[2]} >> $LOCAL_SSH_REMOTE_SSH_AUTHORIZED
else 
    echo "[x] port in use, something went wrong! Terminating..."
    exit 1
fi
echo '[+] Saved pub key from the server'
yes | rm key.pem
echo '[+] Removed access key'
sed -i '10 i\ExecStart=/usr/bin/ssh -nNT -o ExitOnForwardFailure=yes -i /home/novus/.ssh/id_rsa -R '$next_port':localhost:22 '$REMOTE_ADDRESS $SERVICE_FILE
echo '[+] Updated '
ssh -R $next_port:localhost:22 $REMOTE_ADDRESS -i $SSH_DIR/id_rsa 'ssh -tt -oStrictHostKeyChecking=no novus@localhost -i '$REMOTE_SSH_NANO$next_port' -p '$next_port' exit'
