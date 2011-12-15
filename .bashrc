# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# History hijacking
if [ -n "$PS1" ]; then
	bind '"\C-[[A": history-search-backward'
	bind '"\C-[[B": history-search-forward'
fi

# Init for top bar
echo
tput init

# History adjustments
HISTIGNORE="cd:ls:[bf]g:clear:exit:gp:gs"
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=1000000

shopt -s checkwinsize

###
#
#  INCLUDE SECTION. THESE COMMANDS USE THE BASH_XYZ.D DIRECTORIES
#
#  THE ORDER OF INCLUSION MAY BE CHANGED BUT THAT MAY RESULT IN 
#  UNEXPECTED BEHAVIOUR!
#
#####
if [ -f ~/.bash_function ] && [ -d ~/.bash_function.d/ ]
then
	. ~/.bash_function.d/*
fi

if [ -f ~/.bash_alias ] && [ -d ~/.bash_alias.d/ ]
then
	. ~/.bash_alias.d/*
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion

	if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    	. /etc/bash_completion
	fi
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then debian_chroot=$(cat /etc/debian_chroot); fi
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
else
	color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


PROMPT_COMMAND="history -a;tput sc; tput cup 0 0;tput setb 1;tput setf 7;tput bold; ~/.dotfileincludes.d/topbar.sh;tput sgr0;tput rc;"