# .bashrc

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

SHELL_CONFIG_DIR=$HOME/.config/shell

# load functions first and check the current distro
test -s $SHELL_CONFIG_DIR/functions && . $SHELL_CONFIG_DIR/functions || true

detect_distro	# get DISTRO in $SHELL_CONFIG_DIR/functions

test -s $SHELL_CONFIG_DIR/env_vars && . $SHELL_CONFIG_DIR/env_vars || true
test -s $SHELL_CONFIG_DIR/alias && . $SHELL_CONFIG_DIR/alias || true

#
# Fedora bashrc skel
#
if [ $DISTRO = "Fedora" ]; then
  # Source global definitions
  if [ -f /etc/bashrc ]; then
  	. /etc/bashrc
  fi
fi

unset DISTRO

