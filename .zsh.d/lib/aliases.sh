#!/bin/bash
#
# Author:   rocketplane
# Filename: aliases.sh

# +-------------------------------------------------------------------------------------------------
# | Local Aliases
# +-------------------------------------------------------------------------------------------------

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# single characters
alias c='clear'
alias h='htop'
alias f='free -m'
alias p='pwd'

# usefull
#alias less='less -R'
#alias mkdir='mkdir -p -v'
#alias finder='find . -maxdepth 1 -type d -print0 | xargs -0 du -hs | sort -rn'
#alias openports='netstat --all --numeric --programs --inet --inet6 | tail -n +3 | rev | sort -k 1,1 | rev'
#alias mplayer='mplayer -cache 16000 -lavdopts fast:skiploopfilter=all:threads=2 '
#alias ls='ls $COLOR_OPTIONS --group-directories-first --time-style="+%F, %T "'
#alias ll='ls $COLOR_OPTIONS --group-directories-first -lh'
#alias l='ls $COLOR_OPTIONS --group-directories-first -lAh'
#alias grep='grep $COLOR_OPTIONS'
#alias egrep='egrep $COLOR_OPTIONS'
#alias g='git'

# misc
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
#alias acp="rsync -avl --progress"

#complete -W "$(cat "${HOME}/.bash_history" | egrep '^ssh |^scp ' | grep '\.' | egrep '^[^0-9]' | sort | uniq | sed 's/^ssh //' | sed 's/ $//g' | sed 's/^/\"/' | sed 's/$/\"/');" ssh
#complete -W "$(cat "${HOME}/.bash_history" | egrep '^ssh |^scp ' | grep '\.' | egrep '^[^0-9]' | sort | uniq | sed 's/^ssh //' | sed 's/ $//g' | sed 's/^/\"/' | sed 's/$/\"/');" scp

