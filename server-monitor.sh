#!/bin/bash

# version 0.01

#MONITOR

LANG="C" ;

IFS="$(echo -en "\n\b")" ;

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

	if [[ "$(ps aux | grep -v grep | grep -v nano | grep redundanz.sh | awk '{print $2}' | wc -l) " -gt "1" ]] ;
then

# dEFINe vars

loadav=$(uptime | awk '{print $7, $8, $9, $10, $11}') ;

## shi3lD.sh

file01a="shi3lD.sh"

## serv-if-up.sh

file01g="serv-if-up.sh"

###
#
# loadav
#
###

echo "$loadav" ;

###
#
# shi3lD.sh pids users and number of processes
#
###

testproga=$(whereis "$file01a" | cut -f2 -d : | cut -f2 -d\ | sed 's/\//\ /g' | wc -w) ;

testprog1a=$(whereis "$file01a" | cut -f2 -d: | cut -f2 -d\ | sed 's/\//\ /g' | awk '{print $'"$testproga"'}') ;

if [[ "$testprog1a" != '' ]] && [[ $(whereis "$testprog1a" | sed 's/\//\ /g') =~ [^lib$|^bin$|^sbin$] ]] ;

    then

    prgtotesta="$testprog1a" ;
fi

users1="$(ps aux | grep "$prgtotesta" | grep -v grep | awk '{print $1}' | uniq)" ;

usersPID=$(ps aux | grep "$prgtotesta" | grep -v grep | awk '{print $1}' | wc -l) ;

echo -e "\n :: $usersPID PID from $file01a by: "$users1"\n" ;

ps aux | grep "$prgtotesta" | grep -v grep | tail -n1 ;


###
#
# serv-if-up.sh pids users and number of processes
#
###

testprogg=$(whereis "$file01g" | cut -f2 -d : | cut -f2 -d\ | sed 's/\//\ /g' | wc -w) ;

testprog1g=$(whereis "$file01g" | cut -f2 -d: | cut -f2 -d\ | sed 's/\//\ /g' | awk '{print $'"$testprogg"'}') ;

if [[ "$testprog1g" != '' ]] && [[ $(whereis "$testprog1g" | sed 's/\//\ /g') =~ [^lib$|^bin$|^sbin$] ]] ;

then

    prgtotestg="$testprog1g";
fi

users7=$(ps aux | grep "$prgtotestg" | grep -v grep | awk '{print $1}' | uniq) ;

usersPID7=$(ps aux | grep "$prgtotestg" | grep -v grep | awk '{print $1}' | wc -l) ;

echo -e "\n :: $usersPID7 PID from $file01g by: "$users7"\n" ;

ps aux | grep "$prgtotestg" | grep -v grep | tail -n1 ;


fi
fi
