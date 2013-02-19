#!/bin/bash
#
# Install the dot files to the HOME directory

cp -f alias ~/.alias
cp -f bashrc ~/.bashrc

cp -f Xresources ~/.Xresources
xrdb ~/.Xresources
