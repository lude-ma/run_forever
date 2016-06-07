#!/bin/bash
# ============================================================================
# Purpose: Keeps the BRML Baxter data acquisition framework alive forever.
# Description: Run the data recording with the Baxter robot. Repeatedly check 
# 	whether the processes are still running. If one is not, restart all of 
# 	them. Upon receiving a 'Ctrl + C' the script exits. 
# 	To put the still running process into the foreground, type 'fg' in the
# 	terminal.
# Example: . run_forever.sh testlog
# ============================================================================
LOG=$1
PROCS="goal.py joint_server.py camera_server.py kinect_recorder flash_recorder roslaunch rosmaster gzserver gzclient"
# PROCS="goal.py joint_server.py camera_server.py roslaunch rosmaster gzserver gzclient"
CHECK_EVERY_SECONDS=10

echo "Running data acquisition forever."
RESTARTS=0
while true
do
  # echo "Check if any of the processes is not running ..."
  ./${BASH_SOURCE%/*}/scripts/check_all_processes.sh "$PROCS"
  CHECK_RET=$?

  if [ "$CHECK_RET" = "64" ]
  then
    echo -n "Kill all remaining processes ... "
    /bin/bash ${BASH_SOURCE%/*}/scripts/kill_all_processes.sh "$PROCS"
    sleep 30
    
    echo -e "\nStarting for the $(( ++RESTARTS )). time ..."
    /bin/bash ${BASH_SOURCE%/*}/scripts/restart_processes.sh >> "${LOG}_${RESTARTS}.log" 2>&1 &
    sleep 30
  elif [ "$CHECK_RET" = "0" ]
  then
    :
    # echo "... all running"
  else
    echo "ERROR: something bad has happened!"
  fi

  sleep $CHECK_EVERY_SECONDS
done
