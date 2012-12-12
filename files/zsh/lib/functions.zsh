function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}


function load_ssh_keys() {
  if [ -n $SSH_AUTH_SOCK ]; then
    for key in $(find $HOME/.ssh -name '*_rsa'); do
      if [ `/usr/bin/ssh-add -l | grep $key | wc -l` -ne 1 ]; then
        /usr/bin/ssh-add $key
      fi
    done
  fi
}
