#!/bin/bash
mkdir harbor_images
for item in `docker images|grep $1|awk '{print $1":"$2}'`
do
    lastElem=${item##*/}
    targetFilePrefix="$(echo $lastElem | cut -d':' -f1)"
    docker save $item | gzip > harbor_images/$targetFilePrefix.tar.gz
done
