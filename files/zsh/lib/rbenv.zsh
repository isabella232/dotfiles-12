RBENV=$HOME/.rbenv
export PATH=$RBENV/bin:$PATH

if type rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

rbenv_prompt() {
  type rbenv &> /dev/null || return
  prompt=$(rbenv version | cut -d' ' -f1)
  gemsets=$(rbenv gemset active 2> /dev/null)
  if [ $? -eq 0 ]; then
    prompt="$prompt@${gemsets%% *}"
  fi
  echo -n "$prompt "
}
