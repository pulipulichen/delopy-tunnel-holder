#!/bin/bash

apt-get update
apt-get install -y curl wget

wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared-linux-amd64.deb
rm -rf cloudflared-linux-amd64.deb

wget https://pulipulichen.github.io/delopy-tunnel/assets/startup.sh
wget https://pulipulichen.github.io/delopy-tunnel/assets/random_sleep_startup.sh

chmod +x *.sh

echo "@reboot /root/startup.sh" | sudo crontab -u root -
echo "0 3 * * * /root/random_sleep_startup.sh" | sudo crontab -u root -