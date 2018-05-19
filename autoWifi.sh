#!/bin/bash

interface=wlan0

checkaddr=$(/sbin/ifconfig ${interface} | grep inet\  | wc -l)

if [[ $checkaddr == 0 ]]
then
	echo "Wifi: not connected, restarting interface"

	ifdown ${interface}
	ifup ${interface}
else
	echo "Wifi: connected"
fi
