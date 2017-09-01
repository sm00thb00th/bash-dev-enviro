#!/bin/bash

# version 0.01
#REDUNDANZ

		if [ ! $EUID = 0 ] ;
	then
		sudo "$0" ;
else

	if [[ "$(ps aux | grep -v grep | grep -v nano | grep redundanz.sh | awk '{print $2}' | wc -l) " -gt "1" ]] ;
then

LANG="C";

countwarn="0" ;

PIDof=$(pgrep redundanz.sh) ;

		if [[ "$PIDof" != '' ]] ;
then

webserver="apache2" ;

datenbank="mysql" ;

mta="sendmail" ;

mailer="sendmail" ;

empty02='' ;

nohomePartition="No Home Partition on this computer" ;

WARN01="80" ;

WARN02="85" ;

PERCENTUSED01=$(df -h | grep -E /$ | awk '{ print $5 }' | sed -n 's/%//p') ;

PERCENTUSED02=$(df -h | grep -E /home$ | awk '{ print $5 }' | sed -n 's/%//p') ;

IFHOMEEXIST=$(df -h | grep -E /home$) && SIZEONHOME=$(df -h | grep -E /home$ | awk '{print $2}') ;

SIZEON=$(df -h | grep -E /$ | awk '{ print $2 }') ;

USEDON=$(df -h | grep -E /$ | awk '{ print $3 }') ;

INODES=$(df -i | grep -E /$ | awk '{ print $2 }') ;

FREEINODES=$(df -i | grep -E /$ | awk '{ print $4 }') ;

> /tmp/mailapache2status ;

> /tmp/mailsendmailstatus ;

> /tmp/mailmysqlstatus ;

while true

do

checkport80=$(netstat -an | grep LISTEN | grep :80 | awk '{print $4}' | tail -n1) ;

sleep 2 ;

        if [[ "$checkport80" = '' ]];
then
	systemctl stop "$webserver".service ;

	sleep 1 ;

	if systemctl start "$webserver".service ;
then

echo -e "\n\n:: $webserver fails, but restartet successfully, you got an email ::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

systemctl status "$webserver".service > /tmp/mailapache2status ;

cat << EOM | mail "$SUDO_USER"@localhost

Subject:"$webserver" restartet

$(cat /tmp/mailapache2status)

EOM
	else

systemctl status "$webserver".service > /tmp/mailapache2status ;

cat << EOM | mail "$SUDO_USER"@localhost

Subject:"$webserver" cannot_restart

$(cat /tmp/mailapache2status)

EOM

echo -e "\n\n:: you got email, $webserver fails, cannot restart ::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

	fi
fi

checkport25=$(netstat -an | grep LISTEN | grep :25 | awk '{print $4}' | tail -n1) ;

sleep 2 ;

        if [[ "$checkport25" = '' ]];
then

checkprog2=$(whereis "$mta" | awk '{print $2}') ;

	if [[ -e $checkprog2 ]] ;
then
	systemctl stop "$mta".service

sleep 1 ;

        systemctl start "$mta".service > /tmp/mailsendmailstatus ;

        systemctl status "$mta".service >> /tmp/mailsendmailstatus ;

	echo "$?" >> /tmp/mailsendmailstatus ;

sleep 1 ;

cat << EOM | mail "$SUDO_USER"@localhost

Subject:"$mta" restartet

$(cat /tmp/mailsendmailstatus)

EOM

echo -e "\n\n:: $mta is accepting connections again, you got an email ::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

	else

	date "+Start Attempt, Failure Time: %H.%M" > /tmp/mailsendmailstatus ;

cat << EOM | mail "$SUDO_USER"@localhost

Subject:"$mta" cannot_restart

$(cat /tmp/mailsenmailfail)

EOM

echo -e "\n\n:: you got email, $mta cannot restart ::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

	fi
fi

checkport3306=$(netstat -an | grep LISTEN | grep :3306 | awk '{print $4}' | tail -n1) ;

sleep 2 ;

        if [[ "$checkport3306" = '' ]];
then

checkprog3=$(whereis "$datenbank" | awk '{print $2}') ;

	if [[ -e $checkprog3 ]] ;
then
	/etc/init.d/"$datenbank" stop ;

sleep 1 ;
        /etc/init.d/"$datenbank" start > /tmp/mailmysqlstatus ;

        /etc/init.d/"$datenbank" status >> /tmp/mailmysqlstatus ;

	echo "$?" >> /tmp/mailmysqlstatus ;

sleep 1 ;

cat << EOM | mail "$SUDO_USER"@localhost

Subject:"$datenbank" restartet

$(cat /tmp/mailmysqlstatus)

EOM

echo -e "\n\n:: $datenbank is accepting connections again, you got an email ::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

	else

	date "+Start Attempt, Failure Time: %H.%M" > /tmp/mailmysqlstatus ;

cat << EOM | "$datenbank" "$SUDO_USER"@localhost

Subject:$datenbank failure.

$(cat /tmp/mailmysqlstatus )

EOM

echo -e "\n\n:: you got email, $datenbank cannot restart ::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

	fi
fi


if [[ "$WARN01" -lt "$PERCENTUSED01" ]] || [[ "$WARN02" -lt "$PERCENTUSED02" ]] && [[ "$countwarn" = '0' ]] ;

then

if [[ "$IFHOMEEXIST" = '' ]] ;

then

PERCENTUSED02="$nohomePartition" ;

else

echo "";

fi

countwarn=1 ;

cat << EOM | mail "$SUDO_USER"@localhost

Subject:running_out_of_disk_space

_________________________________________________
/


redundanz: On host $(uname -n) :: ;

Warn percentage on /: $WARN01 %

Used percentage on the root /: $PERCENTUSED01

Inodes on host $(uname -n): $INODES

Size on /: $SIZEON GB

Used Inodes on /: $USEDON .

Free Inodes on host $(uname -n): $FREEINODES



_________________________________________________
/home


Warn percentage on /home: $WARN02 %

Used percentage on /home: $PERCENTUSED02

Size on /home: $SIZEONHOME GB

EOM

echo -e "\n\n::WARNING:: your over $WARN01 % or $WARN02 %, you got mail::\n" > /dev/pts/3 ;

date > /dev/pts/3 ;

fi

done

rm -f /tmp/mailapache2status ;

rm -f /tmp/mailsendmailstatus ;

rm -f /tmp/mailmysqlstatus ;

else

killall serv-if-up.sh ;

fi

fi

fi
