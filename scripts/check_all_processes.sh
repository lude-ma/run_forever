#!/bin/bash
PROCS=$1

for i in $PROCS
do
  PROCNAME=`echo $i | sed 's/\(.\)/[\1]/'`
  PID=`ps -edf | grep "$PROCNAME" | grep -v $0 | awk  '{print $2}'`
  if [ "a$PID" = "a" ]
  then
    echo $PROCNAME not running
    exit 64
  fi
done

exit 0
