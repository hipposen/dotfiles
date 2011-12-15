# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
      . ~/.bashrc
    fi
fi

# extend path with homedir bin folder
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi