#!/bin/bash
set -x
for image in `docker images|grep $1|awk '{print $1":"$2}'`
do
	target_image=$(echo "${image/$1/$2}")
	docker tag $image $target_image
	docker push $target_image
done
