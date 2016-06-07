#!/bin/bash
PROCS=$1

for i in $PROCS
do
  PROCNAME=`echo $i | sed 's/\(.\)/[\1]/'`
  PID=`ps -edf | grep "$PROCNAME" | awk  '{print $2}'`
  if [ "a$PID" = "a" ]
  then
     echo no process $PROCNAME
  else
     kill -9 $PID 
  fi
done

exit 0
