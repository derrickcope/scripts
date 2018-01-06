#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
shopt -s histappend
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\033[33;1m\]\t\[\033[m\]-\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;36m\]\h:[\[\033[33;1m\]\w\[\033[1;36m\]]\[\033[m\]\$ "

set -o vi

#set editor and pager
export EDITOR=nvim

#set Terminal
export TERMINAL=urxvt

#set Browser
export BROWSER=w3m
#export BROWSER=google-chrome-stable

#ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# bspwm 
PANEL_FIFO=/tmp/panel_fifo
XDG_CONFIG_HOME=$HOME/.config
PANEL_HEIGHT=24
PANEL_FONT="-*-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
PANEL_WM_NAME=bspwm_panel
export PANEL_WM_NAME PANEL_FONT PANEL_HEIGHT XDG_CONFIG_HOME PANEL_FIFO

#PATH="/home/derrick/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/derrick/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/derrick/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/derrick/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/derrick/perl5"; export PERL_MM_OPT;
