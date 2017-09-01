#!/bin/bash

# version 0.01
# Changes your MAC-ADDRESS and do a list of usable and not usable MAC-ADDRESSES in $HOME.
# restart clamd and snort if failure, cut the Ethernet Interface connection, while starting up
# ctrl+C cut's Ethernet Interface connection and revert to your vendors MAC-ADDRESS

# the name of the Ethernet Interface, older machines tend to have a format like: eth[0-9]
interface="enp0s25" ;

# use enp0s[0-9][0-9] or eth[0-9]
# paste the line below in to the terminal and save your vendors MAC-ADDRESS in the var macadd
# ip link show enp0s25 | grep ether | awk '{print $2}'
macadd="00:25:64:b5:fd:9e" ;

###     WARNING:    DON'T EDIT ANYTHING BELOW       ###
#
# TODO: workaround to save the vendors mac address
#		workaround when clamd fails, snort fails too.

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

clear && echo -e "\n" ;
puffed='' ;
nnumberr="0" ;
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
			let df4="$nnumberr"/10/60 ;
			sudo ip link set dev "$interface" down && sleep 5 && 
			sudo ip link set dev "$interface" up && 
			sudo ip link set dev "$interface" address "$macadd" && 
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
		wc -l | tr -d ' ')" = "2" ]] && [[ "$(ip link show "$interface" | grep ether | awk '{print $2}')" != "$macadd" ]] ;
	then
		spin='.oOo' ; i=0 ;
		spin2='-\|/' ;

		while [[ "$(ps aux | grep -E -i -w 'snort|clamd' | grep -v grep | awk '{print $11}' | grep -E 'snort|clamd' | \
		wc -l | tr -d ' ')" = "2" ]] && [[ "$(ip link show "$interface" | grep ether | awk '{print $2}')" != "$macadd" ]] ;
	do
		((nnumberr++));
		i=$(( (i+1) %4 )) ; printf "\r ${spin2:$i:1} UPTIME:$nnumberr${spin:$i:1} " ; sleep .1 ;
	done
	else
		puffeRR ;
	fi
done

fi
