# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#If running interactively, thed

PATH=$PATH:$HOME/bin

if [ "$PS1" ]; then

    # don't put duplicate lines in the history. See bash(1) for more options
   export HISTCONTROL=ignoredups

    # enable color support of ls and also add handy aliases
    eval `dircolors -b`
   export LANG="en_US.UTF-8"
   export LC_ALL="en_US.UTF-8"
    
    alias tel='finger'
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    # some more ls aliases
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'

alias gibbs='ssh gibbs.if.usp.br'    
alias ap='ssh -X diogro@apostol.cecm.usp.br -D 12345'
alias ccm='ssh diogro@proccm.redealuno.usp.br'
alias q='exit'
alias rm='rm -f'
alias c='clear'
alias install='sudo apt-get install -y'
alias upall='sudo apt-get update && sudo aptitude safe-upgrade -y'
alias search='apt-cache search'
alias king='ssh kingman.ib.usp.br -p 1171'
alias pullmain="rsync -avz --delete --rsh='ssh -p 1171' kingman.ib.usp.br:~/MainProject/ ~/MainProject/"
alias pushmain="rsync -avz --delete --rsh='ssh -p 1171' ~/MainProject/ kingman.ib.usp.br:~/MainProject/"
alias vi="vi $(ls -t1 | awk 'NR==1{print}')"
alias vim="vim --remote-silent"

source /opt/intel/bin/compilervars.sh intel64

    # set a fancy prompt
#    PS1='\u@\h:\w\$ '

C1="\[\033[0;30m\]" # Black
C2="\[\033[1;30m\]" # Dark Gray
C3="\[\033[0;31m\]" # Red
C4="\[\033[1;31m\]" # Light Red
C5="\[\033[0;32m\]" # Green
C6="\[\033[1;32m\]" # Light Green
C7="\[\033[0;33m\]" # Brown
C8="\[\033[1;33m\]" # Yellow
C9="\[\033[0;34m\]" # Blue
C10="\[\033[1;34m\]" # Light Blue
C11="\[\033[0;35m\]" # Purple
C12="\[\033[1;35m\]" # Light Purple
C13="\[\033[0;36m\]" # Cyan
C14="\[\033[1;36m\]" # Light Cyan 
C15="\[\033[0;37m\]" # Light Gray
C16="\[\033[1;37m\]" # White
P="\[\033[0m\]" # Neutral

    PS1="$C5\u$C6@$C5\h$P:$C6\w/> $P"

    
    # If this is an xterm set the title to user@host:dir
    #case $TERM in
    #xterm*)
    #    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    #    ;;
    #*)
    #    ;;
    #esac

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc).
    #if [ -f /etc/bash_completion ]; then
    #  . /etc/bash_completion
    #fi
fi
