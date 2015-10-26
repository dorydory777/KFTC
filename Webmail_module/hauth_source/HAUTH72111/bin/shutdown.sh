#!/bin/sh

ps -eaf | grep java | grep Dhauth | grep -v grep | awk '{print $2}' |
while read PID
do
	echo "Killing $PID ..."
	kill -9 $PID
done
