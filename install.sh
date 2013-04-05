#!/bin/bash -x
#
# Install the dot files to the HOME directory

DIST=$HOME/.config/shell
FONT_CONFIG_DIR=$HOME/.config/fontconfig

if [ ! -d $DIST ]
then
	mkdir -p $DIST || (echo "Fail to create $DIST! Abort."; exit 1)
fi

cp -f bashrc ~/.bashrc
cp -f alias $DIST
cp -f env_vars $DIST
cp -f functions $DIST

cp -f Xresources ~/.Xresources
xrdb ~/.Xresources

if [ ! -d $FONT_CONFIG_DIR ];
then
	mkdir -p $FONT_CONFIG_DIR || (echo "Fail to create $FONT_CONFIG_DIR! Abort."; exit 1)
fi

cp -f fonts.conf $FONT_CONFIG_DIR

# copy my favorite gnome themes

if [ ! -d ~/.themes ]
then
	mkdir -p ~/.themes || (echo "Fail to create ~/.themes! Abort."; exit 1)
fi

cp -r themes/* ~/.themes

