#######################################################################
#!/bin/bash
#Made by liujun
#######################################################################
#定义菜单函数
menu()
{
clear
echo -e "\\e[5;1;31m******\\e[0m\\e[33m=========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m\\e[0m\\e[1;34m-\\e[0m\\e[1;5;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[5;1;32m******\\e[0m"
echo -e "\\e[0m   \\e[1;31m   ***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m"
echo -e "\n1.PS1配色方案1(\\033[35;1msunrun\\e[0m\\e[1;36m@\\e[0m\\e[1;33mtweak\\e[0m\\e[1;34m:\\e[0m\\e[1;31m~/test\\e[0m\\e[5;32m$\\e[0m)\n\n2.PS1配色方案2(\\033[33;1msunrun\\e[0m\\e[1;31m@\\e[0m\\e[1;36mtweak\\e[0m\\e[1;35m:\\e[0m\\e[1;32m~/test\\e[0m\\e[5;1;34m$\\e[0m)\n\n3.返回上一层"
echo -e "\\e[5;1;34m******\\e[0m\\e[31m=========================\\e[0m\\e[1;5;33mtweak\\e[0m\\e[1;34m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[31m==========================\\e[0m\\e[5;1;33m******\\e[0m"
echo ""
echo -en "\\e[1;5;31mY\\e[0m\\e[1;32mou chosed\\e[0m\\e[1;5;31m:\\e[0m\\e[4;1;33m"
read nu
echo -e "\\e[0m   \\e[1;31m   ***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m"
}
START()
{
echo ""
echo ""
echo ""
echo -e "\\e[1;31m...........................\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m.............................\\e[0m"
sleep 1
}

DONE()
{
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

err()
{
echo ""
echo ""
echo ""
echo ""
echo ""
echo -e "\\e[1;33mYou should input the number up\\e[0m\\e[1;5;34m,\\e[0m\\e[31mthanks\\e[0m\\e[5;33m!\\e[0m"
echo -e "\\e[31m===========================\\e[1;5;34mtweak-sunrun\\e[0m\\e[31m=============================\\e[0m"
echo ""
sleep 1
}

while trap 'exit 1' 1 2 3 9

do
	menu
	case $nu in
	1)
	START
	echo "PS1='\[\e[35;1m\]\u\[\e[36;1m\]@\[\e[33;1m\]\h\[\e[34;1m\]:\[\e[31;1m\]\W\[\e[32;1;5m\]\\$\[\e[0m'">> ~/.bashrc
	source ~/.bashrc
	DONE
	;;
	2)
	START
	echo "PS1='\[\e[33;1m\]\u\[\e[31;1m\]@\[\e[36;1m\]\h\[\e[35;1m\]:\[\e[32;1m\]\W\[\e[34;1;5m\]\\$\[\e[0m'" >>~/.bashrc
	source ~/.bashrc
	DONE
	;;
	3)
	break
	;;
	*)
	err
	;;
	esac
done
