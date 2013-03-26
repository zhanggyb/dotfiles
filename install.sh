#!/bin/bash -x
#
# Install the dot files to the HOME directory

DIST=$HOME/.config/shell

if [ ! -d $DIST ];
then
	mkdir -p $DIST || (echo "Fail to create folder! Abort."; exit 1)
fi

cp -f bashrc ~/.bashrc
cp -f alias $DIST
cp -f env_vars $DIST
cp -f functions $DIST

cp -f Xresources ~/.Xresources
xrdb ~/.Xresources

