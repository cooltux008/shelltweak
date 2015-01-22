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

echo -e "\\e[5;33m====================创建中======================\\e[0m"
echo "alias ls='ls -F --color=auto'" >>~/.bashrc
echo "alias dir='dir --color=auto'">>~/.bashrc
echo "alias vdir='vdir --color=auto'">>~/.bashrc
echo "alias grep='grep --color=auto'">>~/.bashrc
echo "alias fgrep='fgrep --color=auto'">>~/.bashrc
echo "alias egrep='egrep --color=auto'">>~/.bashrc
echo "alias ll='ls -lhF --color=auto'">>~/.bashrc
source ~/.bashrc

DONE
