#!/bin/bash
#Made by liujun
while trap 'exit 1' 1 2 3 9
	do
	clear
echo "==============================================="
echo ""
echo "如需恢复请输入y/Y:"
echo ""
echo -n "返回上一层请输入n/N:"
read yn2
if [ "$yn2" = y -o "$yn2" = Y ];then
	clear
echo "==============================================="
echo ""
echo -n "请输入需要恢复的文件或目录(如：/mnt/usb/test):"
read filedir
echo ""
echo ""
echo -n "请输入目标目录：(如：/media/main/)"
read destination
	clear
echo "==============================================="
echo "请选择恢复方式："
echo  -e "\n1.释放${filedir}.tar.gz到${destination}(只适用于*.tar.gz或*.tgz)\n2.释放${filedir}.tar.bz2到${destination}(只适用于*.tar.bz2或*.tbz2)\n3.使用cpio转存${filedir}至目录${destination}(适用于目录间对拷)\n4.退出"
echo "==============================================="
echo ""
echo -n "You chosed: "
read num5
	case $num5 in
	1)
	echo "开始恢复......"
 	echo "==============================================="
	cd ${destination}
	tar -zxvf ${filedir}.tar.gz || tar -zxvf ${filedir}.tgz  2>/dev/null
	echo "恢复完成！"
 	echo "==============================================="
	ls ${destination}
	;;
	2)
	echo "开始恢复......"
 	echo "==============================================="
	cd ${destination}
	tar -jxvf ${filedir} || tar -jxvf ${filedir} 2>/dev/null
	echo "恢复完成！"
 	echo "==============================================="
	ls ${destination}
	;;
	3)
	echo "开始转存......"
 	echo "==============================================="
 	find ${filedir} -depth -print|cpio -pdm  ${destination} 2>/dev/null
	echo "转存完成！"
 	echo "==============================================="
	ls ${destination}
	;;
	4)
	break
	;;
	*)
	echo ""
	echo ""
	echo ""
	echo "Please input the number up!"
 	echo "==============================================="
	sleep 1
	;;
	esac
elif [ "$yn2" = n -o "$yn2" = N ];then
	break
 	else
	echo ""
	echo ""
	echo ""
 	echo "Please input the letter up:"
 	echo "==============================================="
	sleep 1
fi
	done
