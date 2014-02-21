# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="diogro"

source /opt/intel/composer_xe_2013.1.117/bin/compilervars.sh intel64
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
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras github virtualenvwrapper mosh rsync ssh-agent virtualenv tmux screen python)

source $ZSH/oh-my-zsh.sh

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
alias gibbs='ssh gibbs.if.usp.br'
alias lem='mosh lem.ib.usp.br'
alias ccm='ssh diogro@proccm.redealuno.usp.br'
alias q='exit'
alias rm='rm -f'
alias install='sudo apt-get install -y'
alias upall='sudo apt-get update && sudo aptitude safe-upgrade -y'
alias search='apt-cache search'
alias king='ssh kingman.ib.usp.br -p 1171'
alias pullmain="rsync -avz --delete lem.ib.usp.br:~/MainProject/ ~/MainProject/"
alias pushmain="rsync -avz --delete ~/MainProject/ lem.ib.usp.br:~/MainProject/"
alias vi="vi $(ls -t1 | awk 'NR==1{print}')"
alias mkdir='nocorrect noglob mkdir'
alias sudo='nocorrect noglob sudo'
alias cabal='nocorrect noglob cabal'
alias ack='ack-grep'
alias grep='ack-grep'
alias rscp="rsync --rsh='ssh' --partial --progress --archive"
alias notebook="ipython notebook --pylab inline"
alias ijulia="ipython notebook --profile julia"

scp(){ if [[ "$@" =~ : ]];then /usr/bin/scp $@ ; else echo 'You forgot the colon dumbass!'; fi;}

function fuck() {
    if killall -9 "$2"; then
        echo ; echo " (╯°□°）╯︵$(echo "$2"|toilet -f term -F rotate)"; echo
    fi
}

PATH=$PATH:$HOME/.rvm/bin:$HOME/.cabal/bin:$HOME/.bin/anaconda:$HOME/.bin/adt-bundle-linux-x86_64-20131030/sdk/tools:$HOME/.bin/adt-bundle-linux-x86_64-20131030/sdk/platform-tools # Add RVM to PATH for scripting
