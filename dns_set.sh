#! /bin/bash
printf "Current dhclient.conf is :\n"
cat /etc/dhcp/dhclient.conf | grep prepend
printf "The current resolv.conf is :\n"
cat /etc/resolv.conf
printf "Adding DNS Servers 8.8.8.8 and 8.8.8.4 ...\n"
echo "nameserver 8.8.8.8"> /etc/resolv.conf
echo "nameserver 8.8.8.4">> /etc/resolv.conf
printf "The modified resolv.conf is :\n"
cat /etc/resolv.conf
printf "Operation Successfull\n"
printf "Do not restart NetworkManager!!!\n"
printf "Perforom a DNS Leak Test...\n"
