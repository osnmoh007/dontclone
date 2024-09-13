#!/bin/bash

echo "Starting Firefox script..."

# Set the DISPLAY environment variable
export DISPLAY=:1

# Wait for the x11vnc server to start
while ! pgrep -x 'x11vnc'; do
  echo "Waiting for x11vnc server to start..."
  sleep 1
done

echo "x11vnc server is running, waiting 20 seconds before launching Firefox..."
sleep 20

echo "Launching Firefox..."

# Launch Firefox
firefox google.com

echo "Firefox launched, script completed."
