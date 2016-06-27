
#General stuff
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p -v'

# alias codes='cd ~/codes'
alias armk='cd ~/codes/arm-kinglet'
alias armf='cd ~/codes/arm-fpga'

## Bash sensible 
## refer https://github.com/mrzool/bash-sensible

# Turn on recursive globbing (enables ** to recurse all directories)
#shopt -s globstar 2> /dev/null

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
#bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
#bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
#bind "set show-all-if-ambiguous on"

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
#shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
#shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
#shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
export dotfiles="$HOME/codes"
export nuc="$HOME/codes/nuc_experiments"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"


#Code Easy 
function m() {
        about 'Make with error and warnings highlighted'
        # param '1: directory name'

        if [ $# -eq 0 ]; then
                make 2>&1 | grep -E "error|warning|$";
        else
                make "$@" 2>&1 | grep -E "error|warning|$";
        fi;
}

#Login Easy 

function bsh(){
	
	if [ $# -eq 0 ]; then 
		echo "usage bsh <last-digit-ip> to ssh into the board>";
	else
	ssh root@192.168.1."$1"; 
	fi
}	

function take(){
  
 #  if [ $# -eq 0  ]; then 
  if [ -z $1 ];then 
    echo "usage $0 <source> root@<ip> <dest>";    
  else
  scp -r root@192.168.1."$2":"$1" "$3";
  fi 

} 

function put(){
  
 #  if [ $# -eq 0  ]; then 
  if [ -z $3 ];then 
    echo "usage $0 <source> root@<ip>:<dest>";
  else
  scp -r "$1" root@192.168.1."$2":"$3";
  fi 

}

