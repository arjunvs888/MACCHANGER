#!/bin/bash
nic=`ip -o -4 route show to default | awk '{print $5}'`
if [ -z "$nic" ];
then
	printf "No Network Interfaces found!!!!\n Check the Network and try again\n"
	exit
else
	echo "Network Interfaces running ==> $nic"
	for i in $nic; do
		ifconfig $i down
		echo "$i is down....."
		sleep 1
		macchanger -r $i
		sleep 1
		ifconfig $i up
		echo "$i is up....."
		sleep 1
	done
	echo "....................."
	sleep 2
	echo "OPERATION SUCCESSFUL"
fi

