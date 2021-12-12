#!/usr/bin/env bash

SCRIPT_ROOT=$(dirname $(realpath $0))

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

FILES=(tmux.conf)
for file in ${FILES[@]}; do
  CMD="ln -sf $SCRIPT_ROOT/$file $HOME/.$file"
  echo $CMD
  $CMD
done
