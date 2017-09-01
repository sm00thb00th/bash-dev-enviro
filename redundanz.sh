#!/bin/bash

# version 0.01
# first run installs the environment
# You can Add Programs to myPrograms, but remove bevor $HOME/installed
# monitors the servers and applications, defined in server-monitor.sh

myPrograms="xfce4-terminal figlet x11-apps imagemagick mc mutt eject nano snort clamav apache2 mysql-server pychecker shellcheck perl git" ;

###     WARNING:    DON'T EDIT ANYTHING BELOW       ###

LANG="C" ;

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

trap 'ex1Th4ndler' SIGINT ;

ex1Th4ndler(){
		ps aux | grep -v grep | grep serv-if-up.sh | awk '{print $2}' | xargs kill -15 2>/dev/null ;
		wait ;
		exit 0 ;
}

tester_(){

nNuM=$(echo "$myPrograms" | wc -w) ;

		while [[ "$nNuM" != "0" ]] ;
	do
		toInst=$(awk '{print $'"$nNuM"'}'<<<"$myPrograms") ;

		if [[ "$toInst" = "imagemagick" ]] ;
	then
		toInst="display";

		elif [[ "$toInst" = "x11-apps" ]] ;
	then
		toInst="transset";
fi
		wH3RE=$(whereis "$toInst" | cut -f2 -d: | cut -f2 -d\ ) ;
# INSTALL
		if [[ "${#wH3RE}" != "0" ]] ;
	then
		apPR="$toInst, allready installed" ;
		((nNuM--)) ;
	else
		echo -e "\ninstalling ${toInst}..." ;
		nohup apt-get --fix-missing --force-yes install "$toInst" | tee -a "/home/$SUDO_USER/installed" &
		wait ;
		apPR="$toInst, INSTALLED! " ;
		sleep 1 ;
		((nNuM--)) ;
fi
		if [ "$nNuM" = "0" ]
	then
		clear ;
		echo -e "\n done." ;
fi
# ON THE SCREEN
		printf "\rtesting for apps, $nNuM remaining, $apPR" ; sleep 2 ;
		clear ;
	done
		chown "$SUDO_USER":"$SUDO_USER" "/home/$SUDO_USER/installed";

		run_redundanz_;
}

run_redundanz_(){
		setsid serv-if-up.sh >/dev/null 2>&1 < /dev/null &
		watch -n3 -t --color server-monitor.sh ;
}
		if [ -e "/home/$SUDO_USER/installed" ] ;
	then
		run_redundanz_ ;
	else
		tester_ ;
	fi
fi
