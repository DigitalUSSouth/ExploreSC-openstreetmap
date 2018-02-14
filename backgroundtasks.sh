#!/bin/bash
# Start the first process
echo 'Start postgresql database'
service postgresql start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start postgresql: $status"
  exit $status
fi

# Start the second process
echo 'Start apache server'
service apache2 start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start apache2: $status"
  exit $status
fi

#check that all processes are still running otherwise exit
while sleep 60; do
  date +"%T"
  ps aux | grep postgresql | grep -v grep
  PROCESS_1_STATUS=$?
  ps aux | grep apache2 | grep -v grep
  PROCESS_2_STATUS=$?

  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ "$PROCESS_1_STATUS" -ne '0' ] || [ "$PROCESS_2_STATUS" -ne '0' ] ; then
    echo "One of the processes has already exited."
    killall -9 renderd
    exit -1
  fi
done