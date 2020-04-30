#!/bin/bash
nic=`ip -o -4 route show to default | awk '{print $5}'`
if [ -z "$nic" ];
then
	printf "No Network Interfaces found!!!!\n Check the Network and try again\n"
	exit
else
	printf "Network Interfaces running\t ==> $nic\n"
	printf "Only one interface should run at a time! Disable the others.\n "
	while true
	do
	read -p "Run the script now?(Y/N) " answer
	  case $answer in
	   [yY]* ) for i in $nic; do
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
			echo "Setting DNS....."
			source = /root/scripts/dns_set.sh
			./dns_set.sh
			echo "OPERATION SUCCESSFUL"
		   break;;
	   [nN]* ) exit;;
	   * )     echo "Just enter Y or N, please.";;
	  esac
	done
fi

