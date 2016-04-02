# Kustom Bash Prompt, inspired by "Sexy/Extravagant Zsh Prompt"
# Screenshot: http://cloud.gf3.ca/M5rG

#Display fortune cookie
if [[ $- == *i* ]]; then
	echo " "
	fortune -a
	printf "%`tput cols`s" | tr ' ' '='
	echo " "
fi

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ $TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 203)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 121)
      OFFWHITE=$(tput setaf 185)
      WHITE=$(tput setaf 7)
    else
      MAGENTA=$(tput setaf 1)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      OFFWHITE=$(tput setaf 3)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    OFFWHITE="\033[1;35m"
    WHITE="\033[1;47m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function prompt_command() {
  PS1="\[${BOLD}${MAGENTA}\]\u\[$WHITE\]: \[$OFFWHITE\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$GREEN\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
}

PROMPT_COMMAND=prompt_command
