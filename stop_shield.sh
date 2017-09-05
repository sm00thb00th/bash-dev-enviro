#!/bin/bash

# version 0.01
# depends on shi3lD.sh

###     WARNING:    DON'T EDIT ANYTHING BELOW       ###

LANG="C" ;
IFS=$(echo -e "\n\b") ;

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

stop_network(){
	sudo ip link set dev "$(ip link show | grep -v grep | grep MULTICAST | cut -f2 -d: | tr -d '\ ')" down ; sleep 1 ;
}

take_a_look(){
	ifDown0=$(ps aux | grep -v grep | grep clamd | grep -v nano | awk '{print $11}') ;
	ifDown1=$(ps aux | grep -v grep | grep snort | grep -v nano | awk '{print $11}') ;

	if [[ "$ifDown0" = '' ]] ;
then
	echo -e "\nClamAV down, I will try to restart.";
	
    elif [[ "$ifDown1" = '' ]] ;
then
	echo -e "\nSnort down, I will try to restart.";
fi
}

main_(){
	stop_network ;
	take_a_look ;
}
		if [[ "$(ps aux | grep -v grep | grep -v nano | grep shi3lD.sh | awk '{print $2}' | wc -l) " -gt "1" ]] ;
	then
		main_ ;
fi
fi
