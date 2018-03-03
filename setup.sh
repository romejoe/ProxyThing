#!/bin/bash

if hash tinyproxy 2>/dev/null; then
	echo "TinyProxy detected"
else
	echo "Installing TinyProxy"
	if hash apt 2>/dev/null; then
		sudo apt-get install tinyproxy
	else
		echo "Couldn't install TinyProxy"
		exit
	fi
fi

if [ ! -f id_rsa ]; then
	ssh-keygen -t rsa -N "" -f id_rsa
	mkdir -p ~/.ssh/
	cat ~/is_rsa.pub >> ~/.ssh/authorized_keys
fi
echo "Send the following to admin:"
cat id_rsa.pub

echo "Enter server info given by admin:"
read hosty

echo "Enter the port given by admin:"
read porty

cat run.template.sh | sed  "s/\$porty/$porty/g" | sed "s/\$hosty/$hosty/g" > run.sh