# Rails 3 aliases, backwards-compatible with Rails 2.

function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rconsole='_rails_command console'
alias rdbconole='_rails_command dbconsole'
alias rserver='_rails_command server'
