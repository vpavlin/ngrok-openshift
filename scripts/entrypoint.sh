#!/usr/bin/bash

if [ $# -ne 1 ]; then
  echo "Run as: $0 client|server"
  exit 1
fi

exec ./scripts/$1.sh
