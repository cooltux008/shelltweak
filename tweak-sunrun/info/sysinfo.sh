#!/bin/bash
#Made by liujun
echo ""

echo -e "\\e[1;34m******\\e[0m\\e[31m=========================\\e[0m\\e[1;33mtweak\\e[0m\\e[1;34m-\\e[0m\\e[36ms\\e[32mu\\e[0m\\e[33mn\\e[0m\\e[34mr\\e[0m\\e[35mu\\e[0m\\e[36mn\\e[0m\\e[31m==========================\\e[0m\\e[1;33m******\\e[0m"
echo -e "\\e[5;1;31m                                $(lshal|grep 'system.hardware.product'|cut -d "'" -f2)\\e[0m"
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[1;36mt\\e[0m\\e[1;35mw\\e[0m\\e[1;34me\\e[0m\\e[1;33ma\\e[0m\\e[1;32mk\\e[0m\\e[31m\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
echo ""
echo  -e "======================\\e[33m系统信息\\e[0m=========================           \\e[5;31m*\\e[0m \\e[5;32m**\\e[0m  \\e[5;33m***\\e[0m"
echo ""
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
echo -e "19.Java版本：       $(java -version 2>&1|gawk '/java version/ {print $3}' 2>/dev/null|tr -d '"')"
echo -e "20.Firefox版本：    $(firefox -v|cut -d "," -f1)"
echo -e "21.GNOME版本：      $()"
echo -e "22.X服务器版本：    $(X -version 2>&1|grep 'X.Org')"
echo -e "23.GNOME语言：      $LANG"
echo ""
echo -e "\\e[1;31m******\\e[0m\\e[33m=========================\\e[0m\\e[1;31mtweak\\e[0m\\e[1;34m-\\e[0m\\e[1;33msunrun\\e[0m\\e[33m==========================\\e[0m\\e[1;32m******\\e[0m"
sleep 5

 
