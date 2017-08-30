# bash-dev-enviro

° For Debian GNU/Linux with systemd.

° Syntaxcheck with "pychecker", "perl -wc" and "shellcheck".

° Restart Server's.

° Customizable Scripts.

Files:

[month][year].mac_recieves_dhcp_lease # working macs, in $HOME

[month][year].mac_no_dhcp_lease # no dhcp lease, in $HOME

installed # the list of the installed components, in $HOME

shi3lD.sh # changes the mac-address

start_shield.sh # depends on shi3lD.sh

stop_shield.sh # depends on shi3lD.sh

redundanz.sh # install needed components, by first run. restart servers

server-monitor.sh # depends on redundanz.sh

serv-if-up.sh # depends on redundanz.sh

sCRYPtUPdater.sh # Syntaxchecker and update to /usr/local/bin

#

no license, free for use
