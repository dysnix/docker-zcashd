#!/bin/bash
set -e
GOSU="gosu zcash"
# don't use gosu when id is not 0
if [ "$(id -u)" -ne "0" ];then
  GOSU=""
fi
if [[ "$1" == "zcash-cli" || "$1" == "zcash-fetch-params" || "$1" == "zcashd" ]]; then
	exec $GOSU "$@"
else
  exec $GOSU zcashd "$@"
fi
