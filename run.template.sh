#!/bin/bash

DIR=`pwd`
while :
do
	echo "Connecting"
	ssh -i id_rsa -t -t -D 12345 localhost "cd $DIR && ssh -oStrictHostKeyChecking=no -i id_rsa -N -R localhost:$porty:localhost:12345 $hosty"
	echo "Sleeping"
	sleep 5
done
