#!/bin/bash

if [ "$1" == "-h" ] || [ $# -ne 3 ] ; then
	echo "Usage: $0 k8s_namespace k8s_resource_type filter"
	exit 0
fi

list=`kubectl get $2 -n$1|grep $3| awk '{print $1}'`
for i in $list
do
	echo $i
	kubectl delete $2/$i -n$1
done
