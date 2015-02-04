F5DIR=$HOME/.F5Networks
if [ ! -f /usr/local/lib/F5Networks/SSLVPN/var/run/svpn.pid ]; then
  if [ -f $F5DIR/credentials.gpg ]; then
    if [ ! -f $F5DIR/f5fpc.lock ]; then
      touch $F5DIR/f5fpc.lock
      echo "Starting F5 VPN"
      creds=$(gpg2 -dq $HOME/.F5Networks/credentials.gpg)
      f=("${(s/:/)creds}")
      f5fpc --start --host $f[1] --user $f[2] --password $f[3] > /dev/null
      rm -f $F5DIR/f5fpc.lock
    fi
  fi
fi
