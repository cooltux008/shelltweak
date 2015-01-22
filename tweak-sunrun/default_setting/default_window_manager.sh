#!/bin/bash
#Made by liujun
clear
echo "======================================================="
echo "设置默认窗口管理器，如：metacity,compiz(需要3D支持)等"
echo "======================================================="
echo ""
echo ""
echo -n "window-manager :"
read wm
echo "================tweak-sunrun==================="
sleep 1
gconftool-2 --set /desktop/gnome/session/required_components/windowmanager --type string $wm
echo ""
echo ""
echo "==============================================="
echo "注销或重启后生效"
echo "==============================================="
sleep 1
