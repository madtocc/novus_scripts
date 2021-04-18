echo "Europe/Dublin" > /etc/timezone
dpkg-reconfigure -f --frontend=noninteractive openssh-server 
dpkg-reconfigure -f noninteractive tzdata