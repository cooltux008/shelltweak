#!/bin/bash
#To display the base information of your computer
#Made by liujun,2012/02/01
################################################
################################################

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
echo  ""
echo  ""


echo -e "	            *** *** *** *** *** *** *** *** **\n
	 	    *** *** *** ** MENU *** *** *** **\n
		    *** *** *** *** *** *** *** *** **\n"

echo "please input the number which you want !"


echo -e "\n1.硬件信息\n2.Unix-like系统信息\n3.在当前目录生成系统信息的txt文档\n4.系统清理\n5.备份与恢复\n6.预设VIM环境变量为常用值\n7.系统优化\n8.退出\n"

echo "************************************************"
echo 
echo -n "You chosed:"
sleep 2
while trap 'exit 1' 1 2 3 9 15 
	do
read num1
#if [ "$num1" = 1 ];then
case $num1 in
1)
	echo ""
	echo -e "                    $(lshal|grep 'system.hardware.product'|cut -d "'" -f2)"

	echo ""
#	echo -e "1.主板名称：        $(dmidecode -t baseboard|grep -i 'Product Name'|cut -d ":" -f2)" 2>/dev/null
 	echo -e "1.主板名称：        $(lshal 2>/dev/null|grep -i 'system.board.product'|cut -d "'" -f2)" #可以不需要sudo权限运行
#	echo -e "2.主板制造商：      $(dmidecode -t baseboard|grep -i 'Manufacturer'|cut -d ":" -f2)"
  	echo -e "2.主板制造商：      $(lshal 2>/dev/null|grep -i 'system.board.vendor'|cut -d "'" -f2)" #可以不需要sudo权限运行
# 	echo -e "3.BIOS提供商：      $(dmidecode -t 0|grep -i 'Vendor'|cut -d ":" -f2)"
 	echo -e "3.BIOS提供商：      $(lshal 2>/dev/null|grep -i 'system.firmware.vendor'|cut -d "'" -f2)" #可以不需要sudo权限运行
# 	echo -e "4.BIOS版本：        $(dmidecode -t 0|grep -i 'Version'|cut -d ":" -f2)"
  	echo -e "4.BIOS版本：        $(lshal 2>/dev/null|grep -i 'system.firmware.version'|cut -d "'" -f2)" #可以不需要sudo权限运行
#	echo -e "5.BIOS出厂日期：    $(dmidecode -t 0|grep -i 'Release Date'|cut -d ":" -f2)"
 	echo -e "5.BIOS出厂日期：    $(lshal 2>/dev/null|grep -i 'system.firmware.release_date'|cut -d "'" -f2)" #可以不需要sudo权限运行
	echo -e "6.CPU数目：         $(lscpu|grep 'CPU(s):'|gawk '{print $2}')"
	echo -e "7.CPU名称：       \n$(cat /proc/cpuinfo|gawk '/model name/'|cut -d ":" -f2|cut -d "@" -f1)"
cpu=$(grep 'model name' /proc/cpuinfo|cut -d: -f2|uniq -c)
if echo $cpu|grep '@'  1>/dev/null 2>&1;then
	echo -e "8.CPU主频：         $(grep 'model name' /proc/cpuinfo|cut -d: -f2|cut -d "@" -f2|uniq -c|gawk '{print $2 ,"*", $1}')"
else
 	echo -e "8.CPU主频： 	    " 
fi
	echo -e "9.CPU一级缓存：     $(lscpu|gawk '/L1d/ {print $3 " Data cache"}').$(lscpu|gawk '/L1i/ {print $3 " Instuction cache."}')"
	echo -e "10.CPU二级缓存：    $(lscpu|gawk '/L2/ {print $3 " Unified cache."}')"
	echo -e "11.CPU制式：        $(lscpu|gawk '/CPU op-mode/ {print $3,$4,$5}')"
	if [ -d /proc/acpi/thermal_zone/* ];then
	echo -e "12.CPU温度：        $(cat $(find /proc/acpi/thermal_zone -name "temperature") |gawk '{print $2 ,$3}')" 2>/dev/null
	else 
	echo -e "12.CPU温度：       " 
	fi
 	echo -e "13.内存总量：       $(free -m|gawk '/Mem/ {print $2"MB"}')"
	echo -e "14.内存可扩展至：  $(dmidecode -t 16 2>/dev/null|grep -i 'Maximum Capacity'|cut -d ":" -f2)" 2>/dev/null
	echo -e "15.内存条插槽个数：$(dmidecode -t 16 2>/dev/null|grep -i 'Number Of Devices'|cut -d ":" -f2)" 2>/dev/null
	echo -e "16.显卡：          $(lspci|grep 'VGA'|cut -d ":" -f3)"
	echo -e "17.以太网卡：      $(lspci|grep 'Ethernet'|cut -d ":" -f3)"
	echo -e "18.无线网卡：      $(lspci|grep 'Network'|cut -d ":" -f3)"
	echo -e "19.声卡：          $(lspci|gawk '/Audio/'|cut -d ":" -f3)"
	echo -e "20.本地硬盘：       $(lshal 2>/dev/null|grep -i 'scsi.model'|cut -d "'" -f2).$(fdisk -l /dev/sda 2>/dev/null|grep -i 'Disk /dev/sda'|cut -d ":" -f2|cut -d "," -f1)" 2>/dev/null
	echo -e "21.硬盘分区总数：   $(fdisk -l /dev/sda 2>/dev/null|grep '^/dev/sda'|wc -l)" 2>/dev/null
	present=$(cat /proc/acpi/battery/BAT*/info 2>/dev/null|gawk '/present:/ {print $2}' 2>/dev/null)
	if [ $present = yes ] 2>/dev/null;then 
	echo -e "22.电池容量：       $(cat /proc/acpi/battery/BAT*/info|gawk '/design capacity:/ {print $3 ,$4}')" 2>/dev/null
	echo -e "23.电池剩余电量：   $(cat /proc/acpi/battery/BAT*/state|gawk '/remaining capacity:/ {print $3 ,$4}')" 2>/dev/null
	echo -e "24.电池状态：       $(state=$(cat /proc/acpi/battery/BAT*/state|gawk '/charging state:/ {print $3}')
	        if [ $state = charged ];then
			echo "己充满"
		elif [ $state = charging ];then
			echo "充电中"
		else
			echo "放电中"
		fi)"
		else 
	echo -e "22.供电状态：       使用的是交流电源"
		fi


	echo -e "***********************************************************"
	;;
	
#	elif [ "$num1" = 2 ];then





2)
		echo -e "***************************************************"
		echo -e "1.主机名称：        $(hostname)"
		echo -e "2.当前用户：        $(whoami)(UID:$(id -u),GID:$(id -g))"
# 		echo -e "2.当前用户：        $(whoami)($(id|cut -d '(' -f1|tr -s '=' ':'|tr -s 'a-z' 'A-Z'),$(id|cut -d ')' -f2|cut -d '(' -f1|tr -s '=' ':'|tr -s 'a-z' 'A-Z'))"
		echo -e "3.用户主目录：      $HOME"
		echo -e "4.持续运行时间：    $(uptime|cut -d ',' -f1|gawk '{print $3 ,$4}'|tr -d ",")"
		echo -e "5.内核版本：        $(uname -r)"
		echo -e "6.内核架构：        $(lscpu|gawk '/Architecture/ {print $2}')"
		echo -e "7.操作系统：        $(lsb_release -d|gawk '{print $2 ,$3 ,$4 ,$5 ,$6 ,$7 ,$8 ,$9}')" 2> /dev/null
		echo -e "8.发行版本：        $(lsb_release -i|gawk '{print $3}')"
		echo -e "9.系统昵称：        $(lsb_release -c|gawk '{print $2}')"
		echo -e "10.发行代号：       $(lsb_release -r|gawk '{print $2}')"
		echo -e "11.Default shell:   $SHELL"
		echo -e "12.OpenGL硬件渲染： $(glxinfo|grep 'OpenGL renderer'|gawk '{print "Yes"}')"
		echo -e "13.OpenGL提供商：  $(glxinfo|grep 'OpenGL vendor'|cut -d: -f2)"
		echo -e "14.OpenGL渲染器：  $(glxinfo|grep 'OpenGL renderer'|cut -d: -f2)"
		echo -e "15.OpenGL版本：    $(glxinfo|grep 'OpenGL version'|cut -d: -f2)"
		echo -e "16.GCC版本：        $(gcc --version 2>/dev/null|grep gcc|cut -d ' ' -f4 2>/dev/null)" 
		echo -e "17.Python版本：     $(python -V 2>&1|gawk '{print $2}')"
		echo -e "18.GTK版本：        $(pkg-config --modversion gtk+-2.0 2>/dev/null)" 
		echo -e "19.PyGTK版本：      $()"
		echo -e "20.Firefox版本：    $(firefox -v|cut -d "," -f1)"
		echo -e "21.GNOME版本：      $()"
		echo -e "22.X服务器版本：    $(X -version 2>&1|grep 'X.Org')"
		echo -e "23.GNOME语言：      $LANG"
		echo -e "**************************************************"
		;;
#	elif [ "$num1" = 3 ];then





3)
echo ""
while trap 'exit 1' 1 2 3 9 15
	do
echo "确认生成文本请按：y/Y"
echo -n "退出，请按n/N:"
read yn
if [ "$yn" = y -o "$yn" = Y ];then
echo "***************************************************************"
echo "请稍候，info.txt文档正在生成中......."
sleep 1
echo "***************************************************************"
rm -rf $(pwd)/info.txt 2>/dev/null
touch $(pwd)/info.txt
tmp=$(pwd)/info.txt
		echo -e "**********************************************************">$tmp
		echo -e "**********************************************************">>$tmp
		echo "">>$tmp
		echo "                   This is $(whoami)'s computer---$(hostname)!" >>$tmp
		echo "">>$tmp
		echo "">>$tmp
		echo "">>$tmp
		echo "                硬件信息:">>$tmp
		echo "" >>$tmp

	
	echo "">>$tmp
	echo -e "                    $(lshal|grep 'system.hardware.product'|cut -d "'" -f2)">>$tmp
	echo "">>$tmp
	echo "">>$tmp
#	echo -e "1.主板名称：        $(dmidecode -t baseboard|grep -i 'Product Name'|cut -d ":" -f2)">>$tmp
 	echo -e "1.主板名称：        $(lshal 2>/dev/null|grep -i 'system.board.product'|cut -d "'" -f2)" >>$tmp #可以不需要sudo权限运行
#	echo -e "2.主板制造商：      $(dmidecode -t baseboard|grep -i 'Manufacturer'|cut -d ":" -f2)">>$tmp
  	echo -e "2.主板制造商：      $(lshal 2>/dev/null|grep -i 'system.board.vendor'|cut -d "'" -f2)">>$tmp #可以不需要sudo权限运行
#	echo -e "3.BIOS提供商：      $(dmidecode -t 0|grep -i 'Vendor'|cut -d ":" -f2)">>$tmp
 	echo -e "3.BIOS提供商：      $(lshal 2>/dev/null|grep -i 'system.firmware.vendor'|cut -d "'" -f2)">>$tmp #可以不需要sudo权限运行
#	echo -e "4.BIOS版本：        $(dmidecode -t 0|grep -i 'Version'|cut -d ":" -f2)">>$tmp
  	echo -e "4.BIOS版本：        $(lshal 2>/dev/null|grep -i 'system.firmware.version'|cut -d "'" -f2)">>$tmp #可以不需要sudo权限运行
#	echo -e "5.BIOS出厂日期：    $(dmidecode -t 0|grep -i 'Release Date'|cut -d ":" -f2)">>$tmp
 	echo -e "5.BIOS出厂日期：    $(lshal 2>/dev/null|grep -i 'system.firmware.release_date'|cut -d "'" -f2)">>$tmp #可以不需要sudo权限运行
	echo -e "6.CPU数目：         $(lscpu|grep 'CPU(s):'|gawk '{print $2}')">>$tmp
	echo -e "7.CPU名称：      \n$(cat /proc/cpuinfo|gawk '/model name/'|cut -d ":" -f2|cut -d "@" -f1)">>$tmp
cpu=$(grep 'model name' /proc/cpuinfo|cut -d: -f2|uniq -c)
if echo $cpu|grep '@' 1>/dev/null 2>&1;then
	echo -e "8.CPU主频：         $(grep 'model name' /proc/cpuinfo|cut -d: -f2|cut -d "@" -f2|uniq -c|gawk '{print $2 ,"*", $1}')">>$tmp
else
 	echo -e "8.CPU主频： 	    " >>$tmp
fi
	echo -e "9.CPU一级缓存：     $(lscpu|gawk '/L1d/ {print $3 " Data cache"}').$(lscpu|gawk '/L1i/ {print $3 " Instuction cache."}')">>$tmp
	echo -e "10.CPU二级缓存：    $(lscpu|gawk '/L2/ {print $3 " Unified cache."}')">>$tmp
	echo -e "11.CPU制式：        $(lscpu|gawk '/CPU op-mode/ {print $3,$4,$5}')">>$tmp
	echo -e "12.内存总量：       $(free -m|gawk '/Mem/ {print $2"MB"}')">>$tmp
	echo -e "13.内存可扩展至：  $(dmidecode -t 16 2>/dev/null|grep -i 'Maximum Capacity'|cut -d ":" -f2)">>$tmp
	echo -e "14.内存条插槽个数：$(dmidecode -t 16 2>/dev/null|grep -i 'Number Of Devices'|cut -d ":" -f2)">>$tmp
	echo -e "15.显卡：          $(lspci|grep 'VGA'|cut -d ":" -f3)">>$tmp
	echo -e "16.以太网卡：      $(lspci|grep 'Ethernet'|cut -d ":" -f3)">>$tmp
	echo -e "17.无线网卡：      $(lspci|grep 'Network' 2>/dev/null|cut -d ":" -f3)">>$tmp
	echo -e "18.声卡：          $(lspci|gawk '/Audio/'|cut -d ":" -f3)">>$tmp
	echo -e "19.本地硬盘：       $(lshal 2>/dev/null|grep -i 'scsi.model'|cut -d "'" -f2).$(fdisk -l /dev/sda 2>/dev/null|grep -i 'Disk /dev/sda' 2>/dev/null|cut -d ":" -f2|cut -d "," -f1)">>$tmp 2>/dev/null
	echo -e "20.硬盘分区总数：   $(fdisk -l /dev/sda 2>/dev/null|grep '^/dev/sda'|wc -l)">>$tmp 2>/dev/null
	echo -e "21.电池容量：       $(cat /proc/acpi/battery/BAT*/info 2>/dev/null|gawk '/design capacity:/ {print $3 ,$4}')">>$tmp  2>/dev/null
		echo -e "*** *** *** *** *** *** *** *** *** *** *** *** ***">>$tmp
	echo "" >>$tmp
	echo "" >>$tmp
	echo "                      系统信息:">>$tmp

		echo -e "*** *** *** *** *** *** *** *** *** *** *** *** ***">>$tmp
		echo -e "1.主机名称：        $(hostname)">>$tmp
		echo -e "2.当前用户：        $(whoami)(UID:$(id -u),GID:$(id -g))">>$tmp
# 		echo -e "2.当前用户：        $(whoami)($(id|cut -d '(' -f1|tr -s '=' ':'|tr -s 'a-z' 'A-Z'),$(id|cut -d ')' -f2|cut -d '(' -f1|tr -s '=' ':'|tr -s 'a-z' 'A-Z'))">>$tmp
		echo -e "3.用户主目录：      $HOME">>$tmp
		echo -e "4.内核版本：        $(uname -r)">>$tmp
		echo -e "5.内核架构：        $(lscpu|gawk '/Architecture/ {print $2}')">>$tmp
		echo -e "6.操作系统：        $(lsb_release -d|gawk '{print $2 ,$3 ,$4 ,$5 ,$6 ,$7 ,$8 ,$9}')">>$tmp  2> /dev/null
		echo -e "7.发行版本：        $(lsb_release -i|gawk '{print $3}')">>$tmp
		echo -e "8.系统昵称：        $(lsb_release -c|gawk '{print $2}')">>$tmp
		echo -e "9.发行代号：        $(lsb_release -r|gawk '{print $2}')">>$tmp
		echo -e "10.Default shell:   $SHELL">>$tmp
		echo -e "11.OpenGL硬件渲染： $(glxinfo|grep 'OpenGL renderer'|gawk '{print "Yes"}')">>$tmp
		echo -e "12.OpenGL提供商：  $(glxinfo|grep 'OpenGL vendor'|cut -d: -f2)">>$tmp
		echo -e "13.OpenGL渲染器：  $(glxinfo|grep 'OpenGL renderer'|cut -d: -f2)">>$tmp
		echo -e "14.OpenGL版本：    $(glxinfo|grep 'OpenGL version'|cut -d: -f2)">>$tmp
		echo -e "15.GCC版本：        $(gcc --version 2>/dev/null|grep gcc|cut -d ' ' -f4)">>$tmp
		echo -e "16.Python版本：     $(python -V 2>&1|gawk '{print $2}')">>$tmp 
		echo -e "17.GTK版本：        $(pkg-config --modversion gtk+-2.0 2>/dev/null)">>$tmp
		echo -e "18.PyGTK版本：      $()">>$tmp
		echo -e "19.Firefox版本：    $(firefox -v|cut -d "," -f1)">>$tmp
		echo -e "20.GNOME版本：      $()">>$tmp
		echo -e "21.X服务器版本：    $(X -version 2>&1|grep 'X.Org')" >>$tmp
		echo -e "22.GNOME语言：      $LANG">>$tmp
		echo -e "**************************************************">>$tmp
		echo -e "**************************************************">>$tmp
		echo "" >>$tmp
		echo "" >>$tmp
		echo -e "在$(pwd)下己生成info.txt"
		echo ""
		elif [ "$yn" = n -o "$yn" = N ];then
		echo "Quit!"
		exit 0
		else 
			echo "Wrong!"
			echo "Please input again!"
			echo "**********************************************"
			echo "......"
			sleep 2
		fi
		done
		;;









4)
echo -e "\n1.清空“最近文档”列表\n2.清理nautilus缩略图缓存（仅限于GNOME桌面）\n3.退出"
echo "***********************************"
echo -n "You chosed:"
read num2

if [ "$num2" = 1 ];then
	echo "******************************"
	echo "removing ..."
	echo "" > $HOME/.recently-used.xbel
	sleep 1
	echo ""
	echo "Done!"
	echo "******************************"
	elif [ "$num2" = 2 ];then
		echo "*****************************"
		echo "removing..."
		rm -rf $HOME/.thumbnails/* 2>/dev/null
		sleep 1
		echo ""
		echo "Done!"
		echo "*****************************"
		elif [ "$num2" = 3 ];then
		echo "***************************"
		echo "Quit!"
		exit 0
			else 
				echo "You should input the number up,thanks!"
				echo "***************************"
fi
;;





5)
echo ""
echo ""
echo -e "\n1.备份\n2.恢复\n3.退出" 
echo ""
echo "***********************************************"
echo -n  "You chosed:"
read num3
for i in "$num3"
	do
		if [ "$num3" = 1 ];then
			
			echo "如需备份请输入y/Y:"
			echo -n "退出请输入n/N:"
			read yn1
			if [ "$yn1" = y -o "$yn1" = Y ];then
			echo ""
			echo -n "请输入需要备份的文件或目录名(如：/etc)："
			read filedir
			echo -n "您想备份为(如：/home/bak)："
			read backup

			echo "请选择备份方式："
			echo ""
			echo -e "\n1.使用tar生成gz后缀文件${backup}.tar.gz\n2.使用tar生成bz2后缀文件${backup}.tar.bz2\n3.使用cpio转存${filedir}至目录${backup}(适用于目录间对拷)\n4.退出"
			echo ""
			echo "**********************************"
			echo ""
			echo -n "You chosed: "
			read num4
				case $num4 in
				1)
				echo "开始备份......"
				
				echo -e "*** ***"
				sleep 1
				echo -e "*** *** *** ***"
				sleep 1
				echo -e "*** *** *** *** *** ***"
				tar -zcvf ${backup}.tar.gz ${filedir} 2>/dev/null
				echo "备份完成！"
				echo "****************************"
				;;
				2)
				echo "开始备份......"
				echo -e "*** ***"
				sleep 1
				echo -e "*** *** *** ***"
				sleep 1
				echo -e "*** *** *** *** *** ***"
			
				tar -jcvf ${backup}.tar.bz2 ${filedir} 2>/dev/null
				echo "备份完成！"
				echo "****************************"
				;;
				3)

				echo "开始转存......"
				echo -e "*** ***"
				sleep 1
				echo -e "*** *** *** ***"
				sleep 1
				echo -e "*** *** *** *** *** ***"
			find ${filedir} -depth -print|cpio -pdm  ${backup} 2>/dev/null
				echo "转存完成！"
				echo "****************************"
				ls ${backup}
				;;
				4)
				echo "Quit..."
				exit 0
				echo "*********************************"
				;;
				*)
				echo "Please input the number up!"
				sleep 2
				echo "Please input the number up!"
				;;
				esac
			elif [ "$yn1" = n -o "$yn1" = N ];then
			echo "Quit..."
			echo "************************************"
			exit 0
			else
			echo -n "Please input y/Y:"
			echo "********************************"
			fi

		elif [ "$num3" = 2 ];then
			echo "如需恢复请输入y/Y:"
			echo -n "退出请输入n/N:"
			read yn2
			if [ "$yn2" = y -o "$yn2" = Y ];then
			echo ""
			echo -n "请输入需要恢复的文件或目录(如：/mnt/usb/test):"
			read filedir
			echo -n "请输入目标目录：(如：/media/main/)"
			read destination

			echo "**************************"

			echo "请选择恢复方式："
			echo  -e "\n1.释放${filedir}.tar.gz到${destination}(只适用于*.tar.gz或*.tgz)\n2.释放${filedir}.tar.bz2到${destination}(只适用于*.tar.bz2或*.tbz2)\n3.使用cpio转存${filedir}至目录${destination}(适用于目录间对拷)\n4.退出"
			echo "**********************************"
			echo ""
			echo -n "You chosed: "
			read num5
				case $num5 in
				1)
				echo "开始恢复......"
				
				echo -e "*** ***"
				sleep 1
				echo -e "*** *** *** ***"
				sleep 1
				echo -e "*** *** *** *** *** ***"
				cd ${destination}
				tar -zxvf ${filedir}.tar.gz || tar -zxvf ${filedir}.tgz  2>/dev/null
				echo "恢复完成！"
				echo "****************************"
				ls ${destination}
				;;
				2)
				echo "开始恢复......"
			
				echo -e "*** ***"
				sleep 1
				echo -e "*** *** *** ***"
				sleep 1
				echo -e "*** *** *** *** *** ***"
				cd ${destination}
				tar -jxvf ${filedir} || tar -jxvf ${filedir} 2>/dev/null
				echo "恢复完成！"
				echo "****************************"
				ls ${destination}
				;;
				3)

				echo "开始转存......"
				echo -e "*** ***"
				sleep 1
				echo -e "*** *** *** ***"
				sleep 1
				echo -e "*** *** *** *** *** ***"
			find ${filedir} -depth -print|cpio -pdm  ${destination} 2>/dev/null
				echo "转存完成！"
				echo "****************************"
				ls ${destination}
				;;
				4)
				echo "Quit..."
				exit 0
				echo "*********************************"
				;;
				*)
				echo "Please input the number up!"
				sleep 2
				echo "Please input the number up!"
				;;
				esac
		elif [ "$yn2" = n -o "$yn2" = N ];then
		echo "Quit..."
		echo "************************************"
		exit 0
		else
		echo "Please input the letter up:"
		echo "********************************"
		fi
		elif [ "$num3" = 3 ];then
			echo "Quit..."
			exit 0
			echo "********************************"
			else
				echo "You should input the number up!"
				echo "********************************"
				echo "Now,exit!"
				exit 1
	fi
done
;;





6)
echo "VIM预定义环境变量将会大大提高您使用VIM的效率！"
echo ""
echo "允许在您$HOME目录下创建.vimrc文件，请按y/Y:"
echo ""
echo -n "不允许或退出请按n/N:"
read yn3
case ${yn3} in
y|Y)
echo "正在创建，请稍候......"
sleep 2
echo "************************"
echo -e "set nu\nset hlsearch \nset backspace=2 \nset autoindent \nset smartindent \nset ruler \nset showmode \nset showmatch \nset history=400  \nset magic \nset fileencodings=utf-8,gb2312,gbk,gb18030,big5,ucs-bom,cp936,tuf-16,euc-jp \nset nocompatible \nset wildmenu \nset errorbells \nset visualbell \nset report=2 \nsyntax on \nsy on \nfiletype on" >$HOME/.vimrc 2>/dev/null
source $HOME/.vimrc
echo "己成功创建."
;;
n|N)
echo "Quit..."
echo "*********************************************"
exit 0
;;
*)
echo "Wrong,exit!"
exit 1
;;
esac
;;





7)
echo -e "\n1.bash提示符变彩色\n2.定义一些有用的alias\n3.在家目录中创建(desktop/桌面)等软链接\n4.充分利用本机内存再用swap\n5.桌面图标及文件/窗口管理器设置\n6.QUIT"
echo ""
echo -e "You entered:\c"
read num
case $num in



1)
echo -e "目前选取了两种方案"
echo "********************************************"
echo -e "Please input 1 or 2 :\c"
read n
	case $n in
	1)
	echo "PS1='\[\e[35;1m\]\u\[\e[36;1m\]@\[\e[33;1m\]\h\[\e[34;1m\]:\[\e[31;1m\]\W\[\e[32;1m\]\\$\[\e[0m'">> ~/.bashrc
	source ~/.bashrc
	echo ""
	echo -e "You can see the effact by (source ~/.bashrc)"
	exit 0
	;;
	2)
	echo "PS1='\[\e[33;1m\]\u\[\e[31;1m\]@\[\e[36;1m\]\h\[\e[35;1m\]:\[\e[34;1m\]\W\[\e[35;1m\]\\$\[\e[0m'" >>~/.bashrc
	source ~/.bashrc
	echo ""
	echo -e "You can see the effact by (source ~/.bashrc)"
	exit 0
	;;
	*)
	echo -e "quit......"
	exit 1
	;;
	esac
;;



2)
echo "alias ls='ls -F --color=auto'" >>~/.bashrc
echo "alias dir='dir --color=auto'">>~/.bashrc
echo "alias vdir='vdir --color=auto'">>~/.bashrc
echo "alias grep='grep --color=auto'">>~/.bashrc
echo "alias fgrep='fgrep --color=auto'">>~/.bashrc
echo "alias egrep='egrep --color=auto'">>~/.bashrc
echo "alias ll='ls -l'">>~/.bashrc
source ~/.bashrc
echo ""
echo "************************************************"
echo ""
echo -e "You can see the effact by (source ~/.bashrc)"
exit 0
;;



3)
cd ~
ln -s 桌面 desktop
ln -s 下载 download
ln -s 文档 documents
ln -s 图片 pictures
ln -s 音乐 musics
ln -s 视频 videos
;;



4)
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo ""
echo "**************************************"
echo "完成"
;;



5)
echo -e "\n1.桌面默认图标设置\n2.nautilus设置\n3.窗口管理器设置\n4.QUIT"
echo ""
echo ""
echo -n "You inputed :"
read nu

if [ $nu = 1 ];then
	echo -e "\n1.挂载卷的图标\n2.“我的计算机”图标\n3.“主目录”图标\n4.“网络服务器”图标\n5.“垃圾桶”图标"
	echo ""
	echo "**********************************************"
	echo -n "You like:"
	read nu1
	case $nu1 in
	1)
		echo "Please input y/Y or n/N"
		echo ""
		echo "y/Y代表显示，n/N代表不显示"
		echo ""
		echo "***************************************"
		echo -n "You chosed:"
		read yn
		case $yn in
		y|Y)
		gconftool-2 --set /apps/nautilus/desktop/volumes_visible --type bool true
		;;
		n|N)
		gconftool-2 --set /apps/nautilus/desktop/volumes_visible --type bool false
		;;
		*)
		echo "Quit......"
		exit 1
		;;
		esac
	;;
	2)
		echo "Please input y/Y or n/N"
		echo "y/Y代表显示，n/N代表不显示"
		echo ""
		echo "***************************************"
		echo -n "You chosed:"
		read yn
		case $yn in
		y|Y)
		gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type bool true
		;;
		n|N)
		gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type bool false
		;;
		*)
		echo "Quit......"
		exit 1
		;;
		esac
	;;
	3)
		echo "Please input y/Y or n/N"
		echo "y/Y代表显示，n/N代表不显示"
		echo ""
		echo "***************************************"
		echo -n "You chosed:"
		read yn
		case $yn in
		y|Y)
		gconftool-2 --set /apps/nautilus/desktop/home_icon_visible --type bool true
		;;
		n|N)
		gconftool-2 --set /apps/nautilus/desktop/home_icon_visible --type bool false
		;;
		*)
		echo "Quit......"
		exit 1
		;;
		esac
	;;
	4)
		echo "Please input y/Y or n/N"
		echo "y/Y代表显示，n/N代表不显示"
		echo ""
		echo "***************************************"
		echo -n "You chosed:"
		read yn
		case $yn in
		y|Y)
		gconftool-2 --set /apps/nautilus/desktop/network_icon_visible --type bool true
		;;
		n|N)
		gconftool-2 --set /apps/nautilus/desktop/network_icon_visible --type bool false
		;;
		*)
		echo "Quit......"
		exit 1
		;;
		esac
	;;
	5)
		echo "Please input y/Y or n/N"
		echo "y/Y代表显示，n/N代表不显示"
		echo ""
		echo "***************************************"
		echo -n "You chosed:"
		read yn
		case $yn in
		y|Y)
		gconftool-2 --set /apps/nautilus/desktop/trash_icon_visible --type bool true
		;;
		n|N)
		gconftool-2 --set /apps/nautilus/desktop/trash_icon_visible --type bool false
		;;
		*)
		echo "Quit......"
		exit 1
		;;
		esac
	;;
	*)
		echo "Quit......"
		exit 1
	;;
	esac


		elif [ $nu = 2 ];then
		echo "设置默认文件管理器，如：nautilus"
		echo -n "Please input which file-manager you like better:"
		read fm
		gconftool-2 --set /desktop/gnome/session/required_components/filemanager --type string $fm
		echo "注销或重启后生效"

		elif [ $nu = 3 ];then
		echo "设置默认窗口管理器，如：compiz(需要3D支持)"
		echo -n "Please input which window-manager you like better:"
		read wm
		gconftool-2 --set /desktop/gnome/session/required_components/windowmanager --type string $wm
		echo "注销或重启后生效"

			else
				echo "Quit......"
				exit 0
fi
;;



6)
echo "Quit......"
exit 0
;;
*)
exit 1
;;
esac
 		;;





8)
echo "***************************************************************"
echo ""
echo "***************************************************************"
echo "Quit..."
		exit 0
		;;
#	else 




*)
		echo -e "***********************************************"
		echo ""
echo -e "\n1.硬件信息\n2.Unix-like系统信息\n3.在当前目录生成系统信息的txt文档\n4.系统清理\n5.备份与恢复\n6.预设VIM环境变量为常用值\n7.系统优化\n8.退出\n"
		echo -e ""
		echo -e "***********************************************"
		echo ""
		echo "Please input the number up.Thanks!" 1>&2
		echo -n "\nYou chosed: "
		;;
#fi
esac
	done
