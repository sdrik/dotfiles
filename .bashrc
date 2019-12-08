#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

export GPG_TTY="$(tty)"

alias dot='git --git-dir=$HOME/.mycfg --work-tree=$HOME'

function newg {
	echo ",$(getent group "$1" | cut -d: -f4)," | grep -q ",${USER}," || { echo "Invalid group: $1" >&2; return 1; }
	exec sg "$1" newgrp `id -gn`
}
