#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ -z $CHECKUPDATES_DB ]]; then
        export CHECKUPDATES_DB="/var/tmp/checkup-db-${USER}/"
fi

eval `dircolors ~/.dir_colors`

export TERMINAL=urxvtc
