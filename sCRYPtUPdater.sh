#!/bin/bash

# version 0.01
# Set the time interval, and just hit enter to update, to stop "pychecker" or "perl -wc" hit ctrl+4
#
# Set the path to your Scripts like: dirINhome="myDistro" or dirINhome="Desktop/bash"

dirINhome="bash-dev-enviro" ;

# set the file a file on your Project Dir's that you use for crap code
crapC0D3="crap" ;

###     WARNING:    DON'T EDIT ANYTHING BELOW       ###
# TODO: 
#		reset the time interval, because "du" stderr
#		invalid byte sequence with "tr -cd '\11\12\15\40-\176'"
#set -x

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

LANG="C" ;
IFS=$(echo -en "\n\b") ;
syntaxCHkr="pychecker shellcheck perl" ;

# the Work Directory
userHome="/home/${SUDO_USER}/${dirINhome}" ;
# the temp folder
	if [[ "$(df -h | grep -E /dev/shm$ | cut -f2 -d% | tr -d '\ ')" != '' ]] ;
then
	tmpfolder="$(df -h | grep -E /dev/shm$ | cut -f2 -d% | tr -d '\ ')" ;
else
	tmpfolder="/tmp" ;
fi
# User Host Control
echo -e "\n$(date) :: as $USER :: in $(uname -n) :: in $userHome :: WORK -\n" >>"$userHome/wH0rUNSon" ;
# wholeC0unt4: to start by zero after first 
wholeC0unt4="1" ;
# listONmest4tus: to print how many bytes you've changed the last file you've edited
listONmest4tus="0" ;
# excULEC0D3s
excULEC0D3s="SC2009,SC2172,SC2162,SC2010,SC2126,SC2016,SC2034,SC2005,SC2013,SC2059,SC2086,SC2027,SC1091,SC2076" ; 
export excULEC0D3s ;


sC4n(){

# toDayChanged: do a list of changed files in userHome
toDayChanged=$(find "$userHome" -cmin -"$minut3S" -type f | grep -v grep | grep -vE '.kate.swp|.save|.[a-zA-Z][a-zA-Z][0-9][0-9][0-9][0-9]|.[a-zA-Z][0-9][0-9][0-9][0-9][0-9]|wH0rUNSon' | grep -v "$crapC0D3" | grep -vE '.wav|.jpg|.gif|.mp3|.ogg|.aif|.png|.avi|.mp4|master|HEAD|COMMIT_EDITMSG|config|description|sample|index|exclude|refs' | grep -vE '[a-z0-9]{38}') ;

			if [[ "$toDayChanged" != '' ]] ;
	then
			if [[ "$wholeC0unt4" = "0" ]] ;
	then
			wholeC0unt4=$(echo "$toDayChanged" | wc -l | tr -d ' ') ;
			prepare_
	else
			prepare_
fi
fi
}

prepare_(){

# listONme: put the list in reverse and take the take the last entry
listONme="$(echo "$toDayChanged" | sort -r | head -n"$wholeC0unt4" | tail -n1)" ;
# listONmeIS: to determine the file type to check the syntax
listONmeIS=$(echo "$listONme" | xargs file | cut -f2 -d:) ;
# takeLASTword1: put all slashes away so I can take the last word with awk #1
takeLASTword1=$(echo "$listONme" | sed 's/\//\ /g' | wc -w) ;
# toC0pyIS: the file name taken away from absolute path
toC0pyIS=$(echo "$listONme" | sed 's/\//\ /g' | awk '{print $'"$takeLASTword1"'}') ;
# takeLASTword1: put all slashes away so I can take the last word with awk #2
takeLASTword2=$(echo "$listONme" | sed 's/\//\ /g' | sed 's/\./\ /g' | wc -w) ;
# fF1l3suffix: determine the file suffix
fF1l3suffix=$(echo "$listONme" | sed 's/\//\ /g'| sed 's/\./\ /g' | awk '{print $'"$takeLASTword2"'}') ; export fF1l3suffix ;

### ###

	if [[ "$(du -b "$listONme" | cut -f1 2>/dev/null)" -gt "$(du -b "/usr/local/bin/$toC0pyIS" | cut -f1 2>/dev/null)" ]] && [[ "$toC0pyIS" != "wH0rUNSon" ]] && [[ "$toDayChanged" != '' ]] ;
then
	let listONmest4tus=$(du -b "$listONme" | cut -f1)-$(du -b "/usr/local/bin/$toC0pyIS" | cut -f1) 2>/dev/null
	diffANDchecksyntax ;

	elif [[ "$(du -b "$listONme" | cut -f1 2>/dev/null)" -lt "$(du -b "/usr/local/bin/$toC0pyIS" | cut -f1 2>/dev/null)" ]] && [[ "$toC0pyIS" != "wH0rUNSon" ]] && [[ "$toDayChanged" != '' ]] ;
then
	let listONmest4tus=$(du -b "/usr/local/bin/$toC0pyIS" | cut -f1)-$(du -b "$listONme" | cut -f1) 2>/dev/null
	diffANDchecksyntax ;
else
		maincall ;
fi
### ###
}

touchtoC0pyinbin(){

			if [[ "$toC0pyIS" != "wH0rUNSon" ]] ;
		then
			figlet new ; printf "..%s.." "$toC0pyIS" ;
			echo -e "\n" ;
			printf "type 'touch' here: " ; read -r ;
### ###			
			if [[ "$REPLY" = "touch" ]] ;
		then
			sudo touch "/usr/local/bin/$toC0pyIS" ;

			diffANDchecksyntax ;
		else
			echo -e "\ntype correctly" ;
		fi
### ###
	else
		maincall ;
fi
}


diffANDchecksyntax(){

ch3kingSnx='' ;

            if [ -e "/usr/local/bin/$toC0pyIS" ] ;
	then
			echo -e "\n check syntax for: $toC0pyIS\n" ;
			diff -i "$listONme" "/usr/local/bin/$toC0pyIS" ;

			if [[ "$?" != 0 ]] ;
		then
			if [[ "$listONmeIS" =~ 'Bourne-Again ' ]] ;
		then
			ch3kingSnx="shellcheck" ;
			LANG="enUS.UTF-8" ;
			echo "$listONme" | xargs $ch3kingSnx -x -e "$excULEC0D3s" ;
			
			elif [[ "$listONmeIS" =~ 'Python ' ]] ;
		then
			ch3kingSnx="pychecker" ;
			echo "$listONme" | xargs $ch3kingSnx ;

			elif [[ "$listONmeIS" =~ 'Perl ' ]] ;
		then
			ch3kingSnx="perl"
			echo "$listONme" | xargs $ch3kingSnx -wc ;
		fi
			if [[ "$?" != 0 ]] ;
		then
			printf "Do you want to re-edit? "; read -r

		if [[ "$REPLY" = "ok" ]] ;
	then
		nano "$listONme" && diffANDchecksyntax ;
	else
		echo -e "\n :: REMEMBER ::  $listONme\n" ;
fi
			elif [[ $ch3kingSnx = '' ]] ;
		then
			echo -e "\nnothing to check.\n" ;
		else
			echo -e "\n$listONme appears to be ok.\n" ;
            copyToPath ;
		fi
	fi
        else
            touchtoC0pyinbin ;
fi
}

copyToPath(){

			if [[ "$listONmest4tus" -ge "0" ]] && [ -e "/usr/local/bin/$toC0pyIS" ] ;
        then
			echo -e "\n" ;
			printf " :: update? | 'n' " ; read -r
			echo -e "\n" ;

			if [[ "$REPLY" != "n" ]] ;
		then
			echo -e "\n" ;
			sudo cp -f "$listONme" "/usr/local/bin/$toC0pyIS" ;
			sudo chown root:root "/usr/local/bin/$toC0pyIS" ;
			sudo chmod 4755 "/usr/local/bin/$toC0pyIS" ;
			sudo chmod u+s "/usr/local/bin/$toC0pyIS" ;
			figlet "$toC0pyIS"
			echo -e "updated: $(date | awk '{print $4}')\n" ;
			maincall ;
		else
			echo ":: nothing updated" ;
			maincall ;
	fi
fi
}


exiter(){
		sudo rm -f "$tmpfolder"/convert-T0-utf-8.tmp 2>/dev/null;
		echo -e "\n$(date) :: as $USER :: in $(uname -n) :: in $userHome :: exit --\n" >>"$userHome/wH0rUNSon" &&
		echo -e "\n\ngood bye, have a nice Day.\n" && exit 0 ;
}

cont1NU3(){

		if [[ $ch3kingSnx =~ $syntaxCHkr ]] ;
	then
		 ps aux | grep -v grep | grep "$ch3kingSnx" | awk '{print $2}' | xargs sudo kill -15 ;
	else
		echo -e "\nnothing checked"
fi
}

maincall(){

        if [ -e "$userHome" ] ;
    then
		((wholeC0unt4--)) ;
### ###
		if [[ "$listONmest4tus" != "0" ]] ;
	then
		if [[ "$listONmest4tus" = "1" ]] ;
	then
		bYT3S="byte" ;
	else
		bYT3S="bytes" ;
fi
		echo -e "\nYou changed $listONmest4tus $bYT3S" && read -p "waiting..." ;
		sC4n ;
	else
		listONmest4tus="0" ;
		figlet no.changes && read -p "waiting..." ;
		sC4n ;
fi
### ###
	else
		echo -e "\n\nCheck the 'dirINhome' var at the Top of this script\n" && exit 2 ;
fi
}
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
echo -e "\nHello $SUDO_USER, type the interval in minutes, you\b
ussualy need to: write , save and hit enter.\b
update from $userHome to /usr/local/bin.\n" ;
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
printf "type here in minutes: " ; read minut3S ;

	if [[ "$minut3S" = '' ]] ;
then
	exiter ;
else
		while true && trap 'exiter' SIGINT && trap 'cont1NU3' SIGQUIT ;
	do
		maincall ;
	done
fi
fi
