#!/bin/bash
#Made by liujun
clear
echo "==============================================="
echo "设置默认文件管理器，如：nautilus"
echo "==============================================="
echo ""
echo ""
echo -n "file-manager :"
read fm
echo "================tweak-sunrun==================="
sleep 1
gconftool-2 --set /desktop/gnome/session/required_components/filemanager --type string $fm
echo ""
echo ""
echo "==============================================="
echo "注销或重启后生效"
echo "==============================================="
sleep 1
