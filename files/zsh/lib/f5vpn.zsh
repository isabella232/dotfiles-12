if [ ! -f /usr/local/lib/F5Networks/SSLVPN/var/run/svpn.pid ]; then
  if [ -f $HOME/.F5Networks/credentials.gpg ]; then
    echo "Starting F5 VPN"
    creds=$(gpg2 -dq $HOME/.F5Networks/credentials.gpg)
    f=("${(s/:/)creds}")
    f5fpc --start --host $f[1] --user $f[2] --password $f[3] > /dev/null
  fi
fi
