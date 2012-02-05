######## Env Variables ##########

BASE_PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
export PATH=$HOME/bin:$HOME/.gem/ruby/1.8/bin:$BASE_PATH

export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

export TEXPATH=~/.tex
export TEXINPUTS=$TEXINPUTS:$TEXPATH

export VISUAL=view
export EDITOR=vim

######## Shell improvement ########

. /etc/bash_completion

shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s dotglob
shopt -s histreedit
shopt -s nocaseglob

[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

######## Useful aliases ########

alias l='ls -lh --color=auto'
alias la='ls -Alh --color=auto'
alias rm='rm -i'
alias rr='rm -rf'
alias md='mkdir -p'
alias c='clear'

alias now='date +%Y%m%d%H%M%S'

alias suvi='sudo vim'
alias suvim='sudo vim'
alias vimp='vim +Project -p'

alias top='htop'
alias psgr='ps aux | grep'
alias psf='ps faux'
alias psw='ps auxwww'
alias dpgr='dpkg -l | grep'

alias reboot='sudo reboot'
alias halt='sudo halt'

alias utarg='tar -zxvf'
alias utarb='tar -jxvf'
alias targ='tar -zcvf'
alias tarb='tar -jcvf'

alias aptitude='sudo aptitude'
alias ains='aptitude install'
alias aupd='aptitude update'
alias aupgs='aptitude safe-upgrade'
alias asrch='aptitude search'
alias apurg='aptitude purge'

alias sudo='sudo '

alias ipmi='ipmitool -I lanplus -U ADMIN -H'

######## Fancy prompt ########

WHI="\[\033[00m\]"
RED="\[\033[1;31m\]"
GRE="\[\033[1;32m\]"
YEL="\[\033[1;33m\]"
BLU="\[\033[1;34m\]"
MAG="\[\033[1;35m\]"

PS1="$BLU[\$(date +%H%M%S)] $RED${debian_chroot:+($debian_chroot)}[\u@\h$WHI:$GRE\w$RED] # $WHI"

PROMPT_COMMAND=

######## Utilities ########

if [ -n $SSH_AUTH_SOCK ]; then
  for key in $HOME/.ssh/*_rsa; do
    if [ `/usr/bin/ssh-add -l | grep $key | wc -l` -ne 1 ]; then
      /usr/bin/ssh-add $key
    fi
  done
fi

[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
