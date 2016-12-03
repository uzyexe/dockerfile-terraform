#!/bin/sh

## Defaulting to root user (UID 0) to maintain backwards compatibility
USER_ID=${LOCAL_USER_ID:-0}

if [ "$DEBUG" == true ] ; then
  echo "Starting with UID: $USER_ID"
fi
if [ "$USER_ID" -ne "0" ]; then
  adduser -s /bin/sh -D -u $USER_ID user
  export HOME=/home/user
  exec /bin/gosu user /usr/local/bin/terraform "$@"
else
  exec /usr/local/bin/terraform "$@"
fi
