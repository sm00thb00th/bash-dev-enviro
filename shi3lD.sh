#!/bin/bash

# version 0.01 

# Changes your MAC-ADDRESS and do a list of usable and not usable MAC-ADDRESSES in $HOME.
# restart clamd and snort if failure, cut the Ethernet Interface connection, while starting up
# ctrl+C cut's Ethernet Interface connection and revert to your vendors MAC-ADDRESS

###     WARNING:    DON'T EDIT ANYTHING BELOW       ###

#	TODO:
#
#	workaround when clamd fails, snort fails too.

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

clear && echo -e "\n" ;
nnumberr="0" ;
interface=$(ip link show | grep -v grep | grep MULTICAST | cut -f2 -d: | tr -d '\ ') ;
#
puffeRR(){
		if [[ "$(netstat -ar)" =~ 'default' ]] ;
	then
		. /usr/local/bin/stop_shield.sh ;
	else
		clear;
		echo -e "\n ::    D A N G E R      ::" ;
		echo -e "\n :: your shield is down :: \n" && . /usr/local/bin/start_shield.sh ;
	fi
}

exitHandler(){

		echo -e "-"
		printf " quit? (y/n) " ; read
		echo -e "-"

			if [[ $REPLY =~ y|Y|j|J ]] ;
		then
			sudo ip link set dev "$interface" down && sleep 5 && 
			sudo ip link set dev "$interface" up && 
			sudo ip link set dev "$interface" address "$(cat /home/${SUDO_USER}/vendorsmac)" && 
			sudo systemctl restart snort.service && clear && 
			echo -e "\n .You where surfing with this MAC:\n\n
			$(find /home/dob/* -name "*mac_recieves_dhcp_lease*" | grep "$(date | \
			awk '{print $2,$6}' | sed 's/\ //g')" | xargs cat | tail -n1)\n" ;
			exit 0 ;

			elif [[ $REPLY =~ n|N ]] ;
		then
			return ;
	fi
}
		while trap 'exitHandler' SIGINT ;
	do
		if [[ "$(ps aux | grep -E -i -w 'snort|clamd' | grep -v grep | awk '{print $11}' | grep -E 'snort|clamd' | \
		wc -l | tr -d ' ')" = "2" ]] && [[ "$(ip link show "$interface" | grep ether | awk '{print $2}')" != "$(cat /home/${SUDO_USER}/vendorsmac)" ]] ;
	then
		spin='.oOo' ; i=0 ;
		spin2='-\|/' ;

		while [[ "$(ps aux | grep -E -i -w 'snort|clamd' | grep -v grep | awk '{print $11}' | grep -E 'snort|clamd' | \
		wc -l | tr -d ' ')" = "2" ]] && [[ "$(ip link show "$interface" | grep ether | awk '{print $2}')" != "$(cat /home/${SUDO_USER}/vendorsmac)" ]] ;
	do
		((nnumberr++));
		i=$(( (i+1) %4 )) ; printf "\r ${spin2:$i:1} UPTIME:$nnumberr${spin:$i:1} " ; sleep .1 ;
	done
	else
		puffeRR ;
	fi
done
fi
