#!/bin/bash

if [ "$EUID" -ne 0 ]
then
	echo "Please run as root"
	exit 1
fi

script=autoWifi.sh
path=/usr/local/bin/

cp ${script} ${path}${script}
chmod +x ${path}${script}

crontab -l > mycron
echo "*/5 * * * * sh ${path}${script}" >> mycron

crontab mycron
rm mycron
