#!/bin/bash
#Made by liujun
while trap 'exit 1' 1 2 3 9
	do
	clear
echo "==============================================="
echo ""
echo "如需备份请输入y/Y:"
echo ""
echo -n "返回上一层请输入n/N:"
read yn1
if [ "$yn1" = y -o "$yn1" = Y ];then
	clear
echo "==============================================="
echo ""
echo -n "请输入需要备份的文件或目录名(如：/etc)："
read filedir
echo "==============================================="
echo -n "您想备份为(如：/home/bak)："
read backup

	clear
echo "==============================================="
echo "请选择备份方式："
echo ""
echo -e "\n1.使用tar生成gz后缀文件${backup}.tar.gz\n2.使用tar生成bz2后缀文件${backup}.tar.bz2\n3.使用cpio转存${filedir}至目录${backup}(适用于目录间对拷)\n4.退出"
echo "==============================================="
echo ""
echo -n "You chosed: "
read num4
	case $num4 in
	1)
	echo "开始备份......"
	tar -zcvf ${backup}.tar.gz ${filedir} 2>/dev/null
 	echo "==============================================="
	echo "备份完成！"
 	echo "==============================================="
	;;
	2)
	echo "开始备份......"
	tar -jcvf ${backup}.tar.bz2 ${filedir} 2>/dev/null
 	echo "==============================================="
	echo "备份完成！"
 	echo "==============================================="
	;;
	3)
	echo "开始转存......"
 	find ${filedir} -depth -print|cpio -pdm  ${backup} 2>/dev/null
 	echo "==============================================="
	echo "转存完成！"
 	echo "==============================================="
	ls ${backup}
	;;
	4)
	echo "Quit..."
	exit 0
 	echo "==============================================="
	;;
	*)
	echo "Please input the number up!"
	;;
	esac
elif [ "$yn1" = "n" -o "$yn1" = "N" ];then
	break
	else
	echo ""
	echo ""
	echo ""
	echo "Please  input y|Y/n|N"
 	echo "==============================================="
	sleep 1
fi
	done
