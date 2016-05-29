function _route {
  act=$1
  if [ "$(uname)" = "Darwin" ]; then
    if [ "$act" = "del" ]; then act="delete"; fi
    sudo route -q "$act" -net "$2" -interface "$3"
  else
    sudo ip route "$act" "$2" dev "$3"
  fi
}

function awsroutes {
  if [ $# -eq 3 ]; then
    for range in $(curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | \
      jq --arg region "$2" -r '.prefixes[] | select(.region==$region) | select(.service=="EC2") | .ip_prefix'); do
      _route "$1" "$range" "$3"
    done
  else
    echo "$0 <add|del> <region> <tun>"
  fi
}

function awsenv {
  if grep -q -F "[profile ${1}]" ~/.aws/config && grep -q -F "[${1}]" ~/.aws/credentials; then
    export AWS_DEFAULT_PROFILE=$1
  else
    echo Nope
  fi
}
