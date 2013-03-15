# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# My personal settings
#

APP_DIR=$HOME/Apps
export PATH=$PATH:${APP_DIR}/bin

# Sun Java
JAVA_HOME=${APP_DIR}/java
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

# To support IBus Input Method in LibreOffice
export OOO_FORCE_DESKTOP=gnome

# For development
#

# pkg-config
export PKG_CONFIG_PATH=${APP_DIR}/lib/pkgconfig:${APP_DIR}/lib64/pkgconfig

C_INCLUDE_PATH=${APP_DIR}/include
export C_INCLUDE_PATH

CPLUS_INCLUDE_PATH=${APP_DIR}/include
export CPLUS_INCLUDE_PATH

# static libraries
LIBRARY_PATH=${APP_DIR}/lib:${APP_DIR}/lib64
export LIBRARY_PATH

# dynamic libraries
LD_LIBRARY_PATH=${APP_DIR}/lib:${APP_DIR}/lib64
export LD_LIBRARY_PATH

#export PS1="\W \$ "
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\W \\$ \[$(tput sgr0)\]"

