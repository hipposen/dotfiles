#!/bin/bash

FREEMEM=$(cat /proc/meminfo | grep MemFree | awk '{print $2};')
LOADSTAT1=$(cat /proc/loadavg | awk '{print $1};')
LOADSTAT2=$(cat /proc/loadavg | awk '{print $2};')
LOADSTAT3=$(cat /proc/loadavg | awk '{print $3};')
UPTIME=$(cat /proc/uptime | awk '{print $1};')
UPTIME=$(echo $(echo "scale=0;$UPTIME / 3600" | bc):$(echo "scale=0;($UPTIME % 3600 / 60)" | bc):$(echo "scale=0;($UPTIME % 60)" | bc))
DATE=$(date)
FINALSTRING="UPTIME: $UPTIME  MEMORY: $FREEMEM  LOAD: $LOADSTAT1 $LOADSTAT2 $LOADSTAT3  DATE: $DATE"
LENGTH=${#FINALSTRING}
PADWIDTH=$(($(tput cols) - $LENGTH))
PADWIDTH=$(($PADWIDTH / 2))
i=0
while [ $i -lt $PADWIDTH ]
do
	echo -n " "
	i=$(($i + 1))
done;
tput setf 5
echo -n "UPTIME: "
tput setf 7
echo -n "$UPTIME"
tput setf 5
echo -n "  MEMORY: "
tput setf 7
echo -n "$FREEMEM"
tput setf 5
echo -n "  LOAD: "
tput setf 7
echo -n "$LOADSTAT1 $LOADSTAT2 $LOADSTAT3"
tput setf 5
echo -n "  DATE: "
tput setf 7
echo -n "$DATE"

i=0
while [ $i -lt $PADWIDTH ]
do
	echo -n " "
	i=$(($i + 1))
done;

exit 0