#
# ~/.bashrc
#

echo "Microsoft Winows XP [Version 5.1.2600]"
echo "(C) Copyright 1985-2001 Microsoft Corp."
echo ""

BKSLASH='\'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias dir='ls -l'

PS1='C:$(pwd | tr / $BKSLASH 2>/dev/null)> '

