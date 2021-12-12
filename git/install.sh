#!/usr/bin/env bash

SCRIPT_ROOT=$(dirname $(realpath $0))

FILES=(git-prompt.sh git-completion.sh gitconfig gitignore)
for file in ${FILES[@]}; do
  CMD="ln -sf $SCRIPT_ROOT/$file $HOME/.$file"
  echo $CMD
  $CMD
done
