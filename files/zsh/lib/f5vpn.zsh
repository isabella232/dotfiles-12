function f5vpn() {
  F5DIR=$HOME/.F5Networks
  F5PID=/usr/local/lib/F5Networks/SSLVPN/var/run/svpn.pid
  if [ -f $F5PID ]; then
    if [ -e /proc/$(cat $F5PID) ]; then
      echo "F5 VPN already running"
    else
      start_f5vpn
    fi
  else
    start_f5vpn
  fi
}

function start_f5vpn() {
  if [ -f $F5DIR/credentials.gpg ]; then
    echo "Starting F5 VPN"
    creds=$(gpg2 -dq $HOME/.F5Networks/credentials.gpg)
    f=("${(s/:/)creds}")
    f5fpc --start --host $f[1] --user $f[2] --password $f[3] > /dev/null
  fi
}
