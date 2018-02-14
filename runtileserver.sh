#!/bin/bash

echo "starting background tasks"
./backgroundtasks.sh &

#wait for database to start up :/
echo 'waiting for database...'
sleep 60s

# Start the process
echo 'Start renderd service'
renderd -f -c /usr/local/etc/renderd.conf