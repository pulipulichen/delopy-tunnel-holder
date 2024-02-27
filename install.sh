#!/bin/bash

apt-get update
apt-get install -y curl wget

wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared-linux-amd64.deb
rm -rf cloudflared-linux-amd64.deb

wget https://pulipulichen.github.io/delopy-tunnel/assets/startup.sh
wget https://pulipulichen.github.io/delopy-tunnel/assets/random_sleep_startup.sh

chmod +x *.sh

timedatectl set-timezone Asia/Taipei

# Add the @reboot command
echo "@reboot root /root/startup.sh" >> /etc/crontab

# Add the scheduled command
echo "0 3 * * * root /root/random_sleep_startup.sh" >> /etc/crontab

rm -rf install.sh

reboot