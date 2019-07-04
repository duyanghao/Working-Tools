#!/bin/bash
#set -x

if [ "$1" == "-h" ] || [ $# -ne 2 ] ; then
	echo "Usage: $0 serverPath serverName"
	exit 0
fi

server=$1
serverName=$2
let item=0
item=`ps -ef | grep $server | grep -v grep | grep -v $0 | wc -l`

if [ $item -eq 1 ]; then
	echo "The $serverName is running, shut it down..."
	pid=`ps -ef | grep $server | grep -v grep | grep -v $0 | awk '{print $2}'`
	kill -9 $pid
fi

echo "Start $serverName now ..."
$server >> $serverName.log 2>&1 &
