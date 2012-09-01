######## Env Variables ##########

BASE_PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
export PATH=$HOME/bin:$HOME/.gem/ruby/1.8/bin:$BASE_PATH

export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

export TEXPATH=~/.tex
export TEXINPUTS=$TEXINPUTS:$TEXPATH

export VISUAL=less
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
alias suvim='suvi'
alias vimp='vim +Project'

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

######## Functions ########

function is_git_rep {
  git rev-parse --show-toplevel
}

function git_br {
  b=$(git symbolic-ref HEAD 2>/dev/null); [ "$b"  ] && echo ${b##*/}
}

function git_rbm {
  branch=$(git_br)
  if [ $branch  ]; then
    if [ $branch != "master"  ]; then
      git co master
    fi
    git pull && git co $1 && git rebase
  else
    echo "Not a git repo"
  fi
}

function git_prompt {
  b=$(git_br); [ "$b"  ] && echo \($b\)
}

function load_ssh_keys {
  if [ -n $SSH_AUTH_SOCK ]; then
    for key in $(find $HOME/.ssh -name '*_rsa'); do
      if [ `/usr/bin/ssh-add -l | grep $key | wc -l` -ne 1 ]; then
        /usr/bin/ssh-add $key
      fi
    done
  fi
}

function load_rvm_env {
  [[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
}

######## Fancy prompt ########

WHI="\[\033[00m\]"
RED="\[\033[1;31m\]"
GRE="\[\033[1;32m\]"
YEL="\[\033[1;33m\]"
BLU="\[\033[1;34m\]"
MAG="\[\033[1;35m\]"

PS1="$BLU[\$(date +%H%M%S)] $RED${debian_chroot:+($debian_chroot)}\h:\w $GRE\$(git_prompt)$WHI$ "
PROMPT_COMMAND=

load_ssh_keys
load_rvm_env
