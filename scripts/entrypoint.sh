#!/usr/bin/bash

if [ -z ${NGROK_RUN_AS} ]; then
  echo "You need to specify how to run the container in NGROK_RUN_AS - possible values are 'client' and 'server'"
  exit 1
fi

exec ./scripts/${NGROK_RUN_AS}.sh
