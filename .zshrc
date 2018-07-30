# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="diogro"

#source /opt/intel/parallel_studio_xe_2017.0.035/bin/psxevars.sh
#LD_LIBRARY_PATH=/opt/intel/lib/intel64
#export LD_LIBRARY_PATH
plugins=(git git-extras github mosh rsync virtualenv tmux screen python)

source $ZSH/oh-my-zsh.sh

export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
#

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH

# Customize to your needs...

# PDF viewer (just type 'file.pdf')
if [[ -x `which evince` ]]; then
    alias -s 'pdf=evince'
fi

HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt extendedglob
unsetopt caseglob
setopt AUTO_CD

setopt interactivecomments # pound sign in interactive prompt
REPORTTIME=10

alias ll='ls -l'
alias la='ls -a'
alias lem='mosh lem.ib.usp.br'
alias ccm='ssh diogro@proccm.redealuno.usp.br'
alias q='exit'
alias rm='rm -f'
alias install='sudo apt install -y'
alias upall='sudo apt update && sudo apt upgrade -y'
alias search='apt-cache search'
alias mkdir='nocorrect noglob mkdir'
alias sudo='nocorrect noglob sudo'
alias cabal='nocorrect noglob cabal'
alias ack='ack-grep'
alias grep='ack-grep'
alias rscp="rsync --rsh='ssh' --partial --progress --archive"
alias notebook="ipython notebook --pylab inline"

alias ijulia="ipython notebook --profile julia"
alias R='R --no-save --no-restore-data'
alias WorldOfGoo="padsp WorldOfGoo"
alias drm="docker rm -f"
alias dps="docker ps -a"
alias dkl="docker kill"
dkall(){docker kill $(docker ps -aq)}
drmall(){docker rm $(docker ps -aq)}

export ALLOW_WGCNA_THREADS=12

scp(){ if [[ "$@" =~ : ]];then /usr/bin/scp $@ ; else echo 'You forgot the colon dumbass!'; fi;}

function compressPDF(){
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=`echo $1 | sed -e s/.pdf/_LOW.pdf/` $1
}


function k() {
    if killall -9 "$2"; then
        echo ; echo " (╯°□°）╯︵$(echo "$2"|toilet -f term -F rotate)"; echo
    fi
}

if [ "x$DISPLAY" != "x" ]
then
    if [ "screen" = "$TERM" ]
    then
        export TERM=screen-256color
    else
        export TERM=xterm-256color
    fi
    alias vim='vim'
    if [ "x$TERM" = "xxterm" ] || [ "x$TERM" = "xxterm-256color" ]
    then
        function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
    else
        function tvim(){ tmux new-session "vim --servername VIM $@" ; }
    fi
else
    if [ "x$TERM" = "xxterm" ] || [ "x$TERM" = "xxterm-256color" ]
    then
        function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
    else
        function tvim(){ tmux new-session "vim $@" ; }
    fi
fi


GOPATH=$HOME/bin/gocode
PATH=$PATH:$HOME/.rvm/bin:$HOME/.cabal/bin:$HOME/.bin/anaconda:$HOME/.bin/adt-bundle-linux-x86_64-20131030/sdk/tools:$HOME/.bin/adt-bundle-linux-x86_64-20131030/sdk/platform-tools:$HOME/.bin/R:$HOME/.linuxbrew/bin:/home/diogro/bin/anaconda3/bin:$GOPATH/bin:/usr/local/cuda-8.0/bin
MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias fu)"
#source ~/.gnupg/gpg-agent-info
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/lib64

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
