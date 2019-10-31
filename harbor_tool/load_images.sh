#!/bin/bash

for entry in ./*.tar
do
	docker load < $entry
done
