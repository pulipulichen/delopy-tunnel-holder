#!/bin/bash

cd "$(dirname "$0")"

./setup_c.sh

url_data=$(cat url.txt | grep -o 'c=[^&]*' | awk -F'c=' '{print $2}')

export C=$url_data
export URL=`cat target.txt`
export API="https://script.google.com/macros/s/AKfycbzaY3Gzs-juN5DybXMbOozrD7KAtDQJY-fBRnvSH72nz8TyIr3HxnMh_nO-cZPMFCPX/exec";

pkill cloudflared

rm /tmp/tunnel.log

/usr/local/bin/cloudflared tunnel --no-tls-verify --url "$URL" --logfile /tmp/tunnel.log &
sleep 5

# Define the function
extract_url() {
    local file_content=$(cat /tmp/tunnel.log)
    local url=$(echo "$file_content" | grep -o 'http[s]\?://[^[:space:]]\+.trycloudflare.com' | grep -v '^http://localhost' | grep -v '^http://10')
    echo "URL: $url"
}

# Call the function
url=$(extract_url)

# Check if URL is empty
while [ -z "$url" ]; do
    echo "URL is empty. Sleeping for 5 seconds..."
    sleep 5
    url=$(extract_url)
done

# curl -X POST "$API" -d "url=$url&p=$C"
curl -sL "$API?u=$url&p=$C"