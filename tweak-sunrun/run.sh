#!/bin/bash
#Made by liujun,2012/02/01
################################################
################################################


#===============================================
#申明全局变量
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

#===============================================
#定义全局菜单函数

menu()
{
clear
echo  ""
echo -e "\\e[5;1;31m******\\e[0m\\e[33m=========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m\\e[0m\\e[1;34m-\\e[0m\\e[1;5;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[5;1;32m******\\e[0m"
echo -e "\\e[32m                              _ \\e[0m"
echo -e "\\e[32m		__      ___  | | ______  _ ___ __   ___  \\e[0m"
echo -e "\\e[32m		\\ \ /\ / /_\\ | |/ __/ _\\| '_\` _  \ / __ \ \\e[0m"
echo -e "\\e[32m		 \\ V  V /__/ | | (_| (_)| | | | | |  __/\\e[0m"
echo -e "\\e[32m		  \\_/ \/\\___||_|\\_ \___/|_| |_| |_|\\____|\\e[0m"
echo -e "\\e[5;1;34m******\\e[0m\\e[31m=========================\\e[0m\\e[1;5;33mtweak\\e[0m\\e[1;34m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[31m==========================\\e[0m\\e[5;1;33m******\\e[0m"


echo -e ""
echo -e "	            \\e[33m### ### ### ### ### ### ### ### ###\\e[0m\n
		           $(echo -e "\\e[5;31m$(lsb_release -d|cut -d: -f2|tr -d '\t')\\e[0m")\n
		    \\e[33m### ### ### ### ### ### ### ### ###\\e[0m\n"

echo -e "\\e[1;36mplease input the number which you want\\e[0m \\e[5;31m!!!\\e[0m"

echo -e "\n\\e[32m1\\e[0m\\e[5;31m.\\e[0m\\e[33m硬件信息\\e[0m\n\\e[32m2\\e[0m\\e[5;31m.\\e[0m\\e[1;31m$(lsb_release -i|gawk '{print $3}')\\e[0m\\e[33m系统信息\\e[0m\n\\e[32m3\\e[0m\\e[5;31m.\\e[0m\\e[33m在\\e[1;4;36m$HOME\\e[0m\\e[33m下生成系统信息的\\e[0m\\e[1;32minfo.txt\\e[0m\n\\e[32m4\\e[0m\\e[5;31m.\\e[0m\\e[33m系统清理\\e[0m\n\\e[32m5\\e[0m\\e[5;31m.\\e[0m\\e[33m备份与恢复\\e[0m\n\\e[32m6\\e[0m\\e[5;31m.\\e[0m\\e[33m系统优化\\e[0m\n\\e[32m7\\e[0m\\e[5;31m.\\e[0m\\e[33m系统美化\\e[0m\n\\e[32m8\\e[0m\\e[5;31m.\\e[0m\\e[33m系统默认管理器设置\\e[0m\n\\e[32m9\\e[0m\\e[5;31m.\\e[0m\\e[31mQuit\\e[0m" 
echo -e "\\e[1;32m===========================\\e[1;5;36mt\\e[0m\\e[1;5;35mw\\e[0m\\e[1;5;34me\\e[0m\\e[1;5;33ma\\e[0m\\e[1;5;32mk\\e[0m\\e[31m-\\e[0m\\e[5;36ms\\e[5;32mu\\e[0m\\e[5;33mn\\e[0m\\e[5;34mr\\e[0m\\e[5;35mu\\e[0m\\e[5;36mn\\e[0m\\e[1;32m=============================\\e[0m"
echo ""
}
#定义用户选择提示符
choice()
{
echo ""
echo -en "\\e[1;5;31mY\\e[0m\\e[1;32mou chosed\\e[0m\\e[1;5;31m:\\e[0m\\e[4;1;33m"
read nu
echo ""
echo -en "\\e[0m   \\e[1;31m  ***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m\n"
}
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
#定义错误提示函数
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


#===============================================
#全局菜单循环，通过while...do...done实现

while trap 'exit 1' 1 2 3 9 
	do
#===============================================
#调用函数menu
menu
#===============================================
#调用选择函数，提示用户选择

choice
#===============================================
#读取用户输入的选项
#===============================================
#用case语句执行菜单功能

case $nu in
#===============================================

1)
#显示电脑硬件信息

./info/hdinfo.sh
continue
;;
#===============================================

2)
#显示操作系统信息

./info/sysinfo.sh
continue
;;
#===============================================
3)
#在～目录下创建电脑硬件及系统的文本info.txt

./info/creat_info.sh
continue
;;
#===============================================
4)
#系统清理

#清理菜单循环

while trap 'exit 1' 1 2 3 9
	do
#调用清理菜单函数
		clear
tit1
echo -e "\n1.清空“最近文档”列表\n\n2.清理nautilus缩略图缓存（仅限于GNOME桌面）\n\n3.返回上一层"
tit2

choice

#清空“最近文档”列表
if [ "$nu" = 1 ];then
	./clean/recently_history.sh

#清理nautilus缩略图缓存（仅限于GNOME桌面）
	elif [ "$nu" = 2 ];then
	./clean/thumbnails_cache.sh

	elif [ "$nu" = 3 ];then
	break


			else 
			#调用错误提示函数
			err
fi
	done
;;

#===============================================
5)
#执行备份与恢复
while trap 'exit 1' 1 2 3 9
do
clear

tit1
echo -e "\n1.备份\n\n2.恢复\n\n3.返回上一层"
tit2
echo ""
choice
#对用户指定的文件或目录进行备份操作
		if [ "$nu" = 1 ];then
			./dump_restore/dump.sh

#对用户指定的文件或目录进行恢复操作
			elif [ "$nu" = 2 ];then
			./dump_restore/restore.sh

				elif [ "$nu" = 3 ];then
					break

					else
					#调用错误提示函数
					err
	        fi

done
;;

#===============================================
6)
#提高系统可用性和人性化程度 
while trap 'exit' 1 2 3 9

do
#定义子菜单函数
improve()
{
	clear
	tit1
	echo -e "\n1.\\e[31mVIM\\e[0m环境变量设置\n2.在\\e[4;33m$HOME\\e[0m目录中创建(desktop==>桌面)等软链接\n3.定义一些有用的\\e[32malias\\e[0m\n4.充分利用本机内存再用\\e[34mswap\\e[0m(deb系列测试通过)\n5.返回上一层"
	tit2
	echo ""
	choice
}
#调用
improve

	case $nu in
	1)
 	#调用预设VIM的sh

	./improve/vim_better.sh
	;;

	2)
 	#调用建立软链接的sh

	./improve/useful_links.sh
	;;

	3)
 	#调用定义别名的sh

	./improve/alias.sh
	;;

	4)
 	#调用sysctl.sh

	./improve/swappiness_sysctl.sh
	;;

	5)
	break
	;;

	*)
	#调用错误提示函数
	err
	;;
	esac
done
;;

#===============================================
7)
#系统美化
while trap 'exit 1' 1 2 3 9 
do
	clear
	tit1
	echo -e "\n1.\\e[1;31mbash\\e[0m提示符变彩色\n\n2.桌面默认\\e[32m图标\\e[0m设置\n\n3.返回上一层"
	echo ""
	tit2
	echo ""
	choice

	case $nu in

	1)
 	#调用改变bashPS1提示符的shell

	./beauty/color_PS1.sh

	;;	
	  
	2)
 	#对桌面默认图标进行设置

	./beauty/desktop_icons.sh

	;;	
	3)
	break

	;;
	  
	*)
	err

	;;

	esac
done
;;

#===============================================
8)
#修改默认窗口，文件管理器
while trap 'exit 1' 1 2 3 9

do
clear

	tit1
	echo -e "\n1.设置默认\\e[1;31m文件\\e[0m管理器\n\n2.设置默认\\e[1;32m窗口\\e[0m管理器\n\n3.返回上一层"
	tit2
	echo ""
	echo ""
	choice
	case $nu in
	1)
 	#设置默认文件管理器"

		./default_setting/default_file_manager.sh
		;;

	2)
 	#设置默认窗口管理器

		./default_setting/default_window_manager.sh
		;;

	3)
	break 
	;;
	
	*)
	err
	;;
	esac
done

;;

#===============================================
9)

		echo ""
		echo -e "\\e[1;5;31mQuit\\e[0m\\e[5;32m......\\e[0m"
		echo -e "\\e[1;5;33m===========================\\e[1;5;36mt\\e[0m\\e[1;5;35mw\\e[0m\\e[1;5;34me\\e[0m\\e[1;5;33ma\\e[0m\\e[1;5;32mk\\e[0m\\e[5;31m-\\e[0m\\e[5;36ms\\e[5;32mu\\e[0m\\e[5;33mn\\e[0m\\e[5;34mr\\e[0m\\e[5;35mu\\e[0m\\e[5;36mn\\e[0m\\e[5;1;33m=============================\\e[0m"
		exit 0
;;
#===============================================
*)
#再次调用函数err

err
;;
esac
#===============================================

	done
#===============================================
