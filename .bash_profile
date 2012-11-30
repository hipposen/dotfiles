#!/usr/bin/env bash

export ANDROID_SDK_PATH=$HOME/development/mkzero/android/sdk

# Lock and Load a custom theme file
# location /.bash_it/themes/
export PETTY_THEME='mkzero'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Load petty
if [ -d ~/development/mkzero/petty-bash/ ] 
then
    source ~/development/mkzero/petty-bash/petty.bash
elif [ -d ~/.bash/petty/ ]
then
    source ~/.bash/petty/petty.bash
elif [ -d ~/.config/petty/ ]
then
    source ~/.config/petty/petty.bash
fi

