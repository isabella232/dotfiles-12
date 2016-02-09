function awsroutes {
  if [ $# -eq 3 ]; then
    curl -s https://ip-ranges.amazonaws.com/ip-ranges.json | \
    jq --arg region $2 -r '.prefixes[] | select(.region==$region) | select(.service=="EC2") | .ip_prefix' | \
    xargs -Irange sudo ip route $1 range dev $3
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
