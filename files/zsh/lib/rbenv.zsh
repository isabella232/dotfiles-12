RBENV=$HOME/.rbenv
export PATH=$RBENV/bin:$PATH

if type rbenv &> /dev/null; then
  eval "$(rbenv init -)"

  rsudo() {
    set -eu

    ROOT_PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    ROOT_PATH="${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${ROOT_PATH}"

    eval command sudo env PATH=\"\$ROOT_PATH\" \"\$@\"
  }
fi

rbenv_prompt() {
  type rbenv &> /dev/null || return
  prompt=$(cat $RBENV/version)
  gemsets=$(rbenv gemset active 2> /dev/null)
  if [ $? -eq 0 ]; then
    prompt="$prompt@${gemsets%% *}"
  fi
  echo -n "$prompt "
}
