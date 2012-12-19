[[ -r $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm

# get the name of the ruby version
function rvm_prompt_info() {
  [ -f $HOME/.rvm/bin/rvm-prompt ] || return
  local rvm_prompt
  rvm_prompt=$($HOME/.rvm/bin/rvm-prompt $(echo ${ZSH_THEME_RVM_PROMPT_OPTIONS}) 2>/dev/null)
  [[ "${rvm_prompt}x" == "x" ]] && return
  echo "${ZSH_THEME_RVM_PROMPT_PREFIX}${rvm_prompt}${ZSH_THEME_RVM_PROMPT_SUFFIX}"
}

fpath=($rvm_path/scripts/zsh/Completion $fpath)

function _rvm_completion {
  source $rvm_path"/scripts/zsh/Completion/_rvm"
}
compdef _rvm_completion rvm
