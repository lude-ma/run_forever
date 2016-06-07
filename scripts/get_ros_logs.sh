#!/bin/bash
LOG_FILE=$1

# First line in given log file contains the ROS log directory
FIRSTLINE=$(head -n 1 ${LOG_FILE}.log)
ARRAY=($FIRSTLINE)
ROS_LOG_DIR=`dirname ${ARRAY[${#ARRAY[@]} - 1]}`
# echo $ROS_LOG_DIR
# create directory with same name as log file to copy ROS logs into
LOG_DIR=$LOG_FILE
mkdir -p $LOG_DIR
cp ${ROS_LOG_DIR}/* ${LOG_DIR}/

exit 0