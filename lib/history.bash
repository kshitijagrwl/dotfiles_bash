#!/usr/bin/env bash

# Bash History Handling

shopt -s histappend                              # append to bash_history if Terminal.app quits

# Save multi-line commands as one command
shopt -s cmdhist

export HISTCONTROL=${HISTCONTROL:-erasedups}              # erase duplicates; alternative option: export HISTCONTROL=ignoredups
export HISTSIZE=${HISTSIZE:-500000}                       # resize history size
export HISTFILESIZE=${HISTFILESIZE:-100000}               # resize history size

export AUTOFEATURE=${AUTOFEATURE:-true autotest} # Cucumber / Autotest integration

export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export HISTTIMEFORMAT='%F %T '

function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
#bind '"\e[A": history-search-backward'
#bind '"\e[B": history-search-forward'
#bind '"\e[C": forward-char'
#bind '"\e[D": backward-char'
