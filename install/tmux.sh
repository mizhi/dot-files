#!/usr/bin/env bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf `pwd`/tmux.conf ~/.tmux.conf
