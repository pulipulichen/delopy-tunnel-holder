#!/bin/bash

export API_CELL=A9
export URL=https://192.168.0.42:8006/
export API="https://script.google.com/macros/s/AKfycbyemCrwxJ8FqhJzcTwf6OWCqBofEvXHeHB3X9sC7liAtnxrS1H2P2ktOIkaFp0CipKXMQ/exec";

pkill cloudflared

rm /tmp/tunnel.log

/usr/local/bin/cloudflared tunnel --no-tls-verify --url "$URL" --logfile /tmp/tunnel.log &
sleep 10

file_content=$(cat /tmp/tunnel.log)
url=$(echo "$file_content" | grep -o 'http[s]\?://[^[:space:]]\+.trycloudflare.com' | grep -v '^http://localhost' | grep -v '^http://10')
echo "URL: $url"
curl -X POST "$API" -d "url=$url&cell=$API_CELL"