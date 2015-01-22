#!/bin/bash
#Made by liujun
#定义标题分隔栏
tit1()
{
echo -e "\\e[1;35m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\e[0m"
echo -e "\\e[1;5;32m===========================\\e[1;5;36mt\\e[0m\\e[1;5;35mw\\e[0m\\e[1;5;34me\\e[0m\\e[1;5;33ma\\e[0m\\e[1;5;32mk\\e[0m\\e[5;31m-\\e[0m\\e[5;36ms\\e[5;32mu\\e[0m\\e[5;33mn\\e[0m\\e[5;34mr\\e[0m\\e[5;35mu\\e[0m\\e[5;36mn\\e[0m\\e[5;1;32m=============================\\e[0m"
echo -en "\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m\n"
}

tit2()
{
echo -e "\\e[1;33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\e[0m"
echo -e "\\e[1;31m===========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m=============================\\e[0m"
}

choice()
{
echo ""
echo -en "\\e[1;5;31mY\\e[0m\\e[1;32mou chosed\\e[0m\\e[1;5;31m:\\e[0m\\e[4;1;33m"
read yn
echo ""
echo -en "\\e[0m   \\e[1;31m  ***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m\n"
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
clear
	tit1
	echo "VIM预定义环境变量将会大大提高您使用VIM的效率！"
	echo "比如在VIM中显示行号，自动缩排，彩色显示等等"
	tit2
	echo "允许在您$HOME目录下创建.vimrc文件，请按y/Y:"
	echo -n "不允许或退出请按n/N:"
	choice
	case ${yn} in
	y|Y)
	echo ""
	START
	sleep 2
	echo -e "set nu\nset hlsearch \nset flash \nset backspace=2 \nset autoindent \nset smartindent \nset ruler \nset showmode \nset showmatch \nset history=400  \nset magic \nset fileencodings=utf-8,gb2312,gbk,gb18030,big5,ucs-bom,cp936,tuf-16,euc-jp \nset nocompatible \nset wildmenu \nset errorbells \nset visualbell \nset report=2 \nsyntax on \nsy on \nfiletype on" >$HOME/.vimrc 2>/dev/null
	source $HOME/.vimrc

	DONE
	break
	;;

	n|N)
	break
	;;

	*)
	err
	;;
	esac
done
