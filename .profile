# extend path with homedir bin folder
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
      . ~/.bashrc
    fi
fi
