local GPG_ENV=$HOME/.gnupg/gpg-agent.env

function start_gpg_agent {
  /usr/bin/env gpg-agent --daemon --enable-ssh-support --write-env-file ${GPG_ENV} > /dev/null
  chmod 600 ${GPG_ENV}
  . ${GPG_ENV} > /dev/null
}

function setup_gpg_agent() {
  which gpg-agent > /dev/null || return
  if [ -f "${GPG_ENV}" ]; then
    . ${GPG_ENV} > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep gpg-agent > /dev/null
    [ $? -ne 0 ] && start_gpg_agent
  else
    start_gpg_agent
  fi

  GPG_TTY=$(tty)

  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
  export GPG_TTY
}

function load_ssh_keys() {
  if [ $SSH_AUTH_SOCK ]; then
    for key in $(find $HOME/.ssh -name '*_rsa'); do
      if [ $(/usr/bin/ssh-add -l | grep $key | wc -l) -ne 1 ]; then
        /usr/bin/ssh-add $key
      fi
    done
  fi
}
