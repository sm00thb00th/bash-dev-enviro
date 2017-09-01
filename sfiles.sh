#!/bin/bash

clear ;
a=":::  Search for Files or Archives on your Drive  :::";
b="::: and open Each File for further Reading ..." ;

catuser=$(for i in `who -u | wc -l`; do who | head -n1 | tail -n$i | awk '{print $1}'; done) ;

userid=$(cat /etc/passwd | grep $catuser | cut -f3 -d:) ;
FILE=sfiles ;
export FILE ;
export winid
export winwidth

numberof= ;

empty= ;

lines= ;

#IFS='' ;
					if [ ! $EUID = 0 ] ;
				then
					sudo nice -n -15 $0;
		while true

		do
				trap 'quitESAC' 2 ;
mktmpfile1() {

		if [ -e /tmp/rs34rch ] ;
	then
		rm -f /tmp/rs34rch ;

		> /tmp/rs34rch ;

		chmod 0770 /tmp/rs34rch ;

	else
		> /tmp/rs34rch ;

		chmod 0770 /tmp/rs34rch ;
	fi

}

mktmpfile2() {

		if [ -e /tmp/rl1n3 ] ;
	then
		rm -f /tmp/rl1n3 ;

		> /tmp/rl1n3 ;

		chmod 0770 /tmp/rl1n3 ;

	else
		> /tmp/rl1n3 ;

		chmod 0770 /tmp/rl1n3 ;
	fi

}
					casefunc ;
mainREAD() {

		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "";
	        echo "  	  ${name}";
		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "";
	      printf "  	  Type the search path: ";
read s
		echo "";
		echo "";
	      printf "  	  Type the search pattern: ";
read i
		echo "";
		echo "";
	      printf "  	  grep for it: ";
read g
		echo "";
}

searchPRINTNR(){

		mktmpfile1 ;

		if [[ "$s" =~ ^/[a-zA-Z0-9] ]] || [ "$s" = "/" ] || [[ "$i" =~ ^[a-zA-Z0-9] ]];
	then
		for yx in `find $s -regex '[a-zA-Z0-9\ \/\._]*' -type f 2>/dev/null | sed -n '/'${i}'/p' | \
		sed -e 's/'^*.$'/'*.${g}$'/p' 2>/dev/null >| /tmp/rs34rch`;
	do
                echo "";
  	done
		number=$(cat /tmp/rs34rch | wc -l) ;

                echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "  	×                                             		     ×";
                echo "  		There are ${number} files, that";
                echo "  	×                                             		     ×";
                echo "  		match the search pattern";
                echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "";
                                read -p "hit enter to continue...";
	else
                echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "  	×                                             		     ×";
                echo "  	×  Nothing found, your search path or your    		     ×";
                echo "  	×                                             		     ×";
                echo "  	×  search pattern ist outer space, isn't it?  		     ×";
                echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "";
                                read -p "hit enter to continue...";
	fi
}
searchREADSHOW(){

		mktmpfile2 ;

		if [[ "$x" =~ ^/[a-zA-Z0-9] ]] || [ "$x" = "/" ] || [[ "$i" =~ ^[a-zA-Z0-9] ]] ;
	then
		for lines in `cat /tmp/rs34rch | sed 's/\ /\\ /g'`;
	do
		echo -E "$lines">| /tmp/rl1n3

		while read line </tmp/rl1n3
	do
		testMAGIC=$(cat /tmp/rl1n3 | xargs file) && showRESULT && break ;
	done

	done

	else
                echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "  	×                                             		     ×";
                echo "  	×  I have no input to display on your Screen...   	     ×";
                echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "";
                                read -p "hit enter to continue...";
	fi
}

showRESULT(){
		if [[ $number != 0 ]] && [[ $line != $empty ]];
	then
		if [[ $testMAGIC =~ 'ASCII' ]] || [[ $testMAGIC =~ 'UTF-8' ]] || [[ $testMAGIC =~ 'XML' ]] && \
		[[ ! $testMAGIC =~ 'empty' ]] ;
	then
		less $line ;

		elif [[ $testMAGIC =~ 'HTML document' ]] || [[ $testMAGIC =~ 'PDF document' ]] && \
		[[ ! $testMAGIC =~ 'empty' ]] ;
	then
		sudo -u \#$userid firefox $line ;

		elif [[ $testMAGIC =~ 'image data' ]] || [[ $testMAGIC =~ 'pixmap' ]] && [[ ! $testMAGIC =~ 'empty' ]] ;
	then
		IFS='' ;

		echo "${line}" | xargs sudo -u \#$userid display -alpha opaque -normalize -contrast -enhance \
		-quiet -trim -strip -antialias -equalize -window $winid -negate -delay 600 -auto-orient \
		-resize $winwidth -extract $winwidth -crop $winwidth -backdrop ;

		unset IFS ;

		elif [[ $testMAGIC =~ 'Audio' ]] || [[ $testMAGIC =~ 'Stereo' ]] && [[ ! $testMAGIC =~ 'empty' ]] ;
	then
 		sudo -u \#$userid cvlc --play-and-exit $line ;

		elif [[ $testMAGIC =~ '/man/' ]] && [[ $testMAGIC =~ 'gzip compressed data' ]] && [[ ! $testMAGIC =~ 'empty' ]] ;
	then
 		sudo -u \#$userid man $line ;

		elif [[ $testMAGIC =~ '/doc/' ]] && [[ $testMAGIC =~ 'gzip compressed data' ]] && [[ ! $testMAGIC =~ 'empty' ]] ;
	then
 		sudo -u \#$userid info $line ;

		elif [[ $testMAGIC =~ 'gzip compressed data' ]] && [[ ! $testMAGIC =~ 'empty' ]] ;
	then
		sudo -u \#$userid gzip -l $line && read -p "hit enter to continue..." ;

		elif [[ $testMAGIC =~ 'dynamically' ]] || [[ $testMAGIC =~ 'compiled' ]] || [[ $testMAGIC =~ 'interpreter' ]] \
		&& [[ ! $testMAGIC =~ 'empty' ]] ;
	then
 		sudo -u \#$userid hexedit $line ;
	else
                echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "  	×                                             		     ×";
                echo "  	×  I have no input to display on your Screen...   	     ×";
                echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
                echo "";
	fi

	fi
}

shownumberof(){
		trap 'quitESAC' 2 ;

		unset name && name=$a ;

		mainREAD &&

		searchPRINTNR &&

		unset name && name=$b &&

		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "";
		echo "  		... I will proceed with ${i} on ${s} grepping ${g}" ;
		echo "";
		echo "  		${name}";
		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "";
                                read -p "hit enter to continue...";

		searchREADSHOW ;

		shiffta=$(shift | echo $x) ;
}

version(){
		clear ;
echo "";
echo "  	×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
echo "  	×									×";
echo "  	×  sfiles: ver 0.03, AUGUST 2016, sm00thb00th	 /°°\	   /°°\		×";
echo "  	×	     INSPECT YOUR SYSTEM		Ω UU Ω    Ω UU Ω	×";
echo "  	×						  00	    00		×";
echo "  	×  This script search in your internal Drive.		 	     	×";
echo "  	×  - displays on Screen and open each File for	  ||	    ||		×";
echo "  	×    further reading, hearing and watching.				×";
echo "  	×						   ||	     ||		×";
echo "  	×	This script use Following GNU Tools:				×";
echo "  	×   sudo, trap, echo, printf, gzip, vlc, xargs, firefox			×";
echo "  	×   find, sed, less, wc, read, file, line, cut, cat 			×";
echo "  	×						    ||	      ||	×";
echo "  	×   	Future Versions:						×";
echo "  	×   -> Select a file for safediting					×";
echo "  	×   -> Do chroot Environments						×";
echo "  	×   -> Configure and update the System.	     	     ||	       ||	×";
echo "  	×   						  /-----\ 		×";
echo "  	×   CREDITS: add you to the mailing list,	 /	 \ 		×";
echo "  	×            and win a fly from the mars 	/	  \     ||	×";
echo "  	×            space station, dogs for free	|---------| 		×";
echo "  	×						|     ̣| | | 		×";
echo "  	×××××××××××××××××××××××××××××××××××××××××	|_____|°|_|   Zombie	×";
echo "  						××××××××××××××××;××××××××××××××××";

			read -p "hit enter to continue..." ;

			set -- || set "" && casefunc ;
}

flussh(){
			set -- || set "" &&

			rm -f /tmp/rs34rch &&

			rm -f /tmp/rl1n3 &&

			unset winid &&

			unset winwidth &&

			unset IFS ;
}
quitESAC() {
		clear ;
			unset $@ ;
		echo "";

		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "  	×                                             		     ×";
	      printf "  		You want to quit? (ok/no):";
	read
		echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";

			if [[ $REPLY = "ok" ]];
	then
			flussh ;
			clear ;
		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "  	×                                             		     ×";
		echo "  	×    good bye =)                              		     ×";
		echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "";

			pgrep $FILE | xargs kill -9 ;

			elif [[ $REPLY = "no" ]];
	then
		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "  	×                                             		     ×";
		echo "  	×    Ok, let's try again ...                  		     ×";
		echo "  	×                                             		     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";

			read -p "hit enter to continue...";

			$FILE ;

	else
		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "  	×                                             		     ×";
		echo "  	×  Hmm, I don't understand ?????              		     ×";
		echo "  	×							     ×";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "";

			read -p "hit enter to continue...";
		$1 ;
	fi
}

casefunc() {
		clear ;

		if [[ $winid = $empty ]] ;
	then

		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "  	×                                             		     ×";
		echo "  	×    Let's get the window ID, please click [ here ]	     ×";
		echo "  	×                                             		     ×";
		echo -e "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\n";

		winid=$(sudo -u \#$userid xwininfo | head -n6 | tail -n1 | awk '{ print $4 }');

		echo "";
		echo "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
		echo "  	×                                             		     ×";
		echo "  	×    Let's get the window SIZE, please click [ here ]	     ×";
		echo "  	×                                             		     ×";
		echo -e "  	××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××\n";

		winwidth=$(sudo -u \#$userid xwininfo | head -n27 | tail -n1 | awk '{ print $2 }');
	else

echo "";
echo "  	×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
echo "  	×                                             			×";
echo "  	× sfiles:  INSPECT YOUR SYSTEM WITHOUT DAMAGE, DEEP RE SEARCH	×";
echo "  	×                                             			×";
echo "  	×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
echo "  	×                                             			×";
echo "  	×    ::::   SEARCH and DISPLAY FILES and ARCHIVES   ::::	×";
echo "  	×                                             			×";
echo "  	× S) Show number and open each file or archive			×";
echo "  	×                                             			×";
echo "  	× V) Version, Tools, Future-Releases, Credits 			×";
echo "  	×                                             			×";
echo "  	× Q) Quit and drink KARROTENSAFT              			×";
echo "  	×                                             			×";
echo "  	×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××";
echo "";

read doit

case "$doit" in

s|S) shownumberof ;;
v|V) version ;;
q|Q) quitESAC ;;
*)

esac

fi

}

done
	exit $? ;
else
	clear;

	echo ""
	echo "Just run, and type your password, you must be in the sudoers file."
	echo ""
fi
