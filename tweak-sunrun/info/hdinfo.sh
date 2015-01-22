#######################################################################
#!/bin/bash
#Made by liujun
#######################################################################
menu()
{
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[0m\\e[1;31mtweak\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
echo -e "\n\<hello, my name is Tux!\>"
     echo -e "\n     ~~~~ "
echo -e "\n    |o_o |"
echo -e "\n    |:_/ |"
echo -e "\n   //   \ \\"
echo -e "\n  (| Tux | )"
echo -e "\n /'\_   _/\`  \\"
echo -e "\n \_\^_)=(\^__/"
echo -e "\\e[1;34m******\\e[0m\\e[31m=========================\\e[0m\\e[1;33mtweak\\e[0m\\e[1;34m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[31m==========================\\e[0m\\e[1;33m******\\e[0m"
echo -e "\\e[5;1;31m                                $(lshal|grep 'system.hardware.product'|cut -d "'" -f2)\\e[0m"
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
echo ""
}
#调用菜单函数
menu

echo  -e "======================\\e[33m硬件信息\\e[0m=========================           \\e[5;31m*\\e[0m \\e[5;32m**\\e[0m  \\e[5;33m***\\e[0m"

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

echo ""
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[0m\\e[1;31mtweak\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
sleep 5
