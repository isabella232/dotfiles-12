# Rails 3 aliases, backwards-compatible with Rails 2.

function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rcons='_rails_command console'
alias rdbcons='_rails_command dbconsole'
alias rserv='_rails_command server'
