#!/bin/sh

gconftool-2 --set /desktop/gnome/peripherals/mouse/cursor_theme --type string "new_cursor"

sudo sed s/old_cursor/new_cursor/ /etc/alternatives/x-cursor-theme > temporalfile.txt ; sudo mv temporalfile.txt /etc/alternatives/x-cursor-theme

