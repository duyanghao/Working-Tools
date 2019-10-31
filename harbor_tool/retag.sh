#!/bin/bash
for item in `docker images|grep -v REPOSITORY|awk '{print $1":"$2}'`
do
	echo $item
	cat << EOF > Dockerfile
FROM $item
RUN echo -e 'hello world'
EOF
	cat Dockerfile
	docker build -t ${item}-x .
	sleep 5
done
