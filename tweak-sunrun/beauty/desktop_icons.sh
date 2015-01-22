#######################################################################
#!/bin/bash
#Made by liujun
#######################################################################
#定义标题美化栏
tit1()
{
echo -e "\\e[1;35m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\e[0m"
echo -e "\\e[1;5;32m===========================\\e[1;5;36mt\\e[0m\\e[1;5;35mw\\e[0m\\e[1;5;34me\\e[0m\\e[1;5;33ma\\e[0m\\e[1;5;32mk\\e[0m\\e[5;31m-\\e[0m\\e[5;36ms\\e[5;32mu\\e[0m\\e[5;33mn\\e[0m\\e[5;34mr\\e[0m\\e[5;35mu\\e[0m\\e[5;36mn\\e[0m\\e[5;1;32m=============================\\e[0m"
echo -e "\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***\\e[0m"
echo ""
}

tit2()
{
echo -e "\\e[1;33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\\e[0m"
echo -e "\\e[1;31m===========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m=============================\\e[0m"
echo ""
}
#定义程序执行开始通知提示
START()
{
echo -e "\\e[1;31m...........................\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m.............................\\e[0m"
sleep 1
}

#定义程序执行结束通知提示 
DONE()
{
echo ""
echo ""
echo ""
echo -e "\\e[1;32mDone!\\e[0m"
echo -e "\\e[1;31m===========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[1;31m=============================\\e[0m"
echo ""
sleep 1
}

#定义错误提示函数
err()
{
echo ""
echo ""
echo ""
echo ""
echo ""
echo -e "\\e[1;33mPlease input the letter up,thanks\\e[0m\\e[1;5;34m,\\e[0m\\e[31mthanks\\e[0m\\e[5;33m!\\e[0m"
echo -e "\\e[31m===========================\\e[1;5;34mtweak-sunrun\\e[0m\\e[31m=============================\\e[0m"
echo ""
sleep 1
}
#定义y/n判断函数
yn()
{
echo ""
echo -e "\\e[1;31m显示\\e[0m图标请按\\e[1;32my|Y\\e[0m\\e[1;34m 隐藏\\e[0m图标请按\\e[1;33mn|N\\e[0m\n\\e[1;36m返回\\e[0m上一层请按\\e[1;35mb|B\\e[0m\n "
tit2
echo -en "\\e[1;5;31mY\\e[0m\\e[1;32mou chosed\\e[0m\\e[1;5;31m:\\e[0m\\e[4;1;33m"
read yn
echo ""
echo -en "\\e[0m   \\e[1;31m  ***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m\n"
}

choice()
{
clear
tit1
echo -e "\\e[33m1.“挂载卷”图标\n2.“计算机”图标\n3.\\e[0m\\033[4;1;36m“$(whoami)\\e[0m\\e[33m的主文件夹”图标\n4.“网络服务器”图标\n5.“回收站”图标\n6.返回上一层\\e[0m"
tit2
echo -en "\\e[1;5;31mY\\e[0m\\e[1;32mou chosed\\e[0m\\e[1;5;31m:\\e[0m\\e[4;1;33m"
read nu
echo ""
echo -en "\\e[0m   \\e[1;31m  ***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m\n"
}

while trap 'exit 1' 1 2 3 9
		do
	choice
	case $nu in
	1)
	while trap 'exit 1' 1 2 3 9
	do
	#调用yn函数
		clear
		tit1
		echo -e "\\e[1;31m“挂载卷“\\e[0m图标"
		yn
		case $yn in
		y|Y)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/volumes_visible --type bool true
		DONE
		;;
		n|N)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/volumes_visible --type bool false
		DONE
		;;
		b|B)
		break
		;;
		*)
		err
		;;
		esac
	done
	;;
	2)
	while trap 'exit 1' 1 2 3 9
	do
	#调用yn函数
		clear
		tit1
		echo -e "\\e[1;31m“计算机”\\e[0m图标"
		yn
		case $yn in
		y|Y)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type bool true
		DONE
		;;

		n|N)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type bool false
		DONE
		;;

		b|B)
		break
		;;

		*)
		err
		;;
		esac
	done
	;;
	3)
	        echo "=============================================="
	while trap 'exit 1' 1 2 3 9
	do
	#调用yn函数
		clear
		tit1
		echo -e "\\e[1;31m“\\e[0m\\e[1;36m$(whoami)\\e[0m\\e[1;31m的主文件夹”\\e[0m图标"
		yn
		case $yn in
		y|Y)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/home_icon_visible --type bool true
		DONE
		;;
		n|N)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/home_icon_visible --type bool false
		DONE
		;;

		b|B)
		break
		;;

		*)
		err
		;;
		esac
	done
	;;
	4)
	while trap 'exit 1' 1 2 3 9
	do
	#调用yn函数
		clear
		tit1
		echo -e "\\e[1;31m“网络服务器”\\e[0m图标"
		yn
		case $yn in
		y|Y)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/network_icon_visible --type bool true
		DONE
		;;
		n|N)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/network_icon_visible --type bool false
		DONE
		;;

		b|B)
		break
		;;

		*)
		err
		;;
		esac
	done
	;;
	5)
	while trap 'exit 1' 1 2 3 9
	do
	#调用yn函数
		clear
		tit1
		echo -e "\\e[1;31m“回收站”\\e[0m图标"
		yn
		case $yn in
		y|Y)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/trash_icon_visible --type bool true
		DONE
		;;
		n|N)
		START
		sleep 1
		gconftool-2 --set /apps/nautilus/desktop/trash_icon_visible --type bool false
		DONE
		;;
		b|B)
		break
		;;

		*)
		err
		;;
		esac
	done
	;;
	6)
	break
	;;
	*)
	err
	;;
esac
		done

