# bash-dev-enviro

° For Debian GNU/Linux with systemd. version 0.01

° Syntaxcheck with "pychecker", "perl -wc" and "shellcheck"

° Restart Server's

° Customizable Scripts

° For Programmers and Administrators

# Usage:

run ./iNST4LL.sh from ../bash-dev-enviro. You must have an entry in the sudoers file

The script will install all needed components:

snort xfce4-terminal figlet x11-apps imagemagick mc mutt eject nano clamav clamav-daemon clamav-base kate 
clamav-freshclam clamav-milter clamdscan apache2 mysql-server sendmail pychecker shellcheck perl dwww git

Run from Terminal: sCRYPtUPdater.sh to:

Edit your Projects with your favorite Editor, upload your Scripts or packed versions of perl or python to 

/usr/local/bin, stop a big compile with ctrl+4, be sure you change more then one byte.

redundanz.sh :

Restart Apache2 MySQL sendmail, takes care about free space and notifiy on /dev/pts3 and per email

# Files:

installed # the list of the installed components, in $HOME

redundanz.sh # install needed components, by first run. restart servers

server-monitor.sh # depends on redundanz.sh

serv-if-up.sh # depends on redundanz.sh

sCRYPtUPdater.sh # Syntaxchecker and update to /usr/local/bin

iNST4LL.sh # installs the environment and copy 54 new files in /usr/local/bin

#

no license, free for use
