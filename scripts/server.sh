#!/usr/bin/bash

echo "Starting server"

if [ -z ${NGROK_DOMAIN} ]; then
  echo "You need to provide domain in NGROK_DOMAIN"
  exit 1
fi

exec ngrokd -domain ${NGROK_DOMAIN} -httpAddr :8080 -httpsAddr :8443 -tunnelAddr :9443