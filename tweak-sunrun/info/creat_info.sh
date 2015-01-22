#!/bin/bash
#Made by liujun
echo "============================tweak-sunrun=============================">$HOME/info.txt
tmp=$HOME/info.txt
cat $PWD/picture_string/tux >>$tmp 
echo -e "\\e[33mPlease wait just \\e[5;32m3\\e[0m \\e[35mseconds!\\e[0m"
echo -e "==================================================================">>$tmp
echo -e "========================SYSTERM INFOMATION========================">>$tmp
echo -e "==================================================================">>$tmp
echo "">>$tmp
echo "                   This is $(whoami)'s computer---$(hostname)!" >>$tmp
echo "">>$tmp
echo "">>$tmp
echo "">>$tmp
echo -e "=============================硬件信息:============================">>$tmp
echo "" >>$tmp
echo "">>$tmp
echo -e "                    $(lshal|grep 'system.hardware.product'|cut -d "'" -f2)">>$tmp
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[0m\\e[1;31mtweak\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
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
echo "" >>$tmp
echo -e "===============================tweak-sunrun============================">>$tmp
cat $PWD/picture_string/bird >>$tmp
echo "" >>$tmp
echo "" >>$tmp
echo -e "======================系统信息:=======================">>$tmp

echo "">>$tmp
echo "">>$tmp
echo -e "====================tweak-sunrun======================">>$tmp
echo -e "">>$tmp
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
echo -e "18.Java版本：       $(java -version 2>&1|gawk '/java version/ {print $3}' 2>/dev/null|tr -d '"')">>$tmp
echo -e "19.Firefox版本：    $(firefox -v|cut -d "," -f1)">>$tmp
echo -e "20.GNOME版本：      $()">>$tmp
echo -e "21.X服务器版本：    $(X -version 2>&1|grep 'X.Org')" >>$tmp
echo -e "22.GNOME语言：      $LANG">>$tmp
echo -e "========================Tux=======================">>$tmp
echo "">>$tmp
echo -e "=====================tweak-sunrun=================">>$tmp
cat $PWD/picture_string/bsd >> $tmp
echo "" >>$tmp
echo "" >>$tmp
echo "============================tweak-sunrun=============================">>$tmp
echo ""
echo -en "\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;34m***\\e[0m   \\e[1;35m***\\e[0m   \\e[1;5;31m***\\e[0m   \\e[1;36m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;34m***\\e[0m   \\e[1;5;36m***\\e[0m   \\e[1;31m***\\e[0m   \\e[1;5;32m***\\e[0m   \\e[1;33m***  \\e[0m\n"
echo ""
echo ""
sleep 2
echo -e "在\\033[31m$HOME\\e[0m下己生成\\e[5;32minfo.txt\\e[0m"
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[0m\\e[1;31mtweak\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
sleep 3
