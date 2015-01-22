#!/bin/bash
#Made by liujun
DONE()
{
	sleep 1
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


cd ~
ln -s 桌面 desktop
ln -s 下载 download
ln -s 文档 document
ln -s 图片 picture
ln -s 音乐 music
ln -s 视频 video

DONE
