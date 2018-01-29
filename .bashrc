# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Put your fun stuff here.

export GPG_TTY="$(tty)"

alias dot='git --git-dir=$HOME/.mycfg --work-tree=$HOME'

function newg {
	echo ",$(getent group "$1" | cut -d: -f4)," | grep -q ",${USER}," || { echo "Invalid group: $1" >&2; return 1; }
	exec sg "$1" newgrp `id -gn`
}
