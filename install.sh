#!/usr/bin/env bash

TOOL=$1
DOT_FILE_ROOT=$(dirname $(realpath $0))

function usage() {
  echo "Error. Need toolname."
  echo "install.sh <toolname>"
}

if [[ -z $TOOL ]]; then
  usage
  exit
fi

TOOL_PATH="$DOT_FILE_ROOT/$TOOL"


"$TOOL_PATH/install.sh"