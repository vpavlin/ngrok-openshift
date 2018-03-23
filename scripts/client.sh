#!/usr/bin/bash

echo "Starting client"

if [ -z ${NGROK_SUBDOMAIN} ]; then
  echo "You need to provide subdomain in NGROK_SUBDOMAIN"
  exit 1
fi

if [ -z ${NGROK_PROXY_TO} ]; then
  echo "You need to provide destination host for tunneling in NGROK_PROXY_TO"
  exit 1
fi

CONFIG=""
if [ -z ${NGROK_USE_DEFAULT} ] || [ ${NGROK_USE_DEFAULT} == "false" ] || [ ${NGROK_USE_DEFAULT} == "False" ]; then
  CONFIG=-config ngrok-config.yaml
fi

exec ngrok ${CONFIG} -subdomain ${NGROK_SUBDOMAIN} ${NGROK_PROXY_TO}