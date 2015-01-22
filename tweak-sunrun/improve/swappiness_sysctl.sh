#!/bin/bash
#Made by liujun
DONE()
{
	sleep 1
	echo ""
	echo ""
	echo ""
	echo -e "\\e[1;32mDone!\\e[0m"
	echo -e "\\e[1;31m===========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m=============================\\e[0m"
	echo ""
	echo -e "\\e[1;32mYou can see the effact by \\e[0m\\e[1;31m(source ~/.bashrc)\\e[0m"
	echo -e "\\e[1;31m===========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m=============================\\e[0m"
	sleep 1
}
echo "vm.swappiness=10" >> /etc/sysctl.conf
sysctl -p

DONE
