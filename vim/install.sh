#!/usr/bin/env bash

SCRIPT_ROOT=$(dirname $(realpath $0))

if [[ ! -d $HOME/.vim ]]; then
    mkdir $HOME/.vim
fi

if [[ ! -d $HOME/.vim/bundle ]]; then
    mkdir $HOME/.vim/bundle
fi

if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

ln -sf $SCRIPT_ROOT/vimrc $HOME/.vimrc

vim +PluginInstall +qall

pushd $HOME/.vim/bundle/YouCompleteMe && ./install.py --clang-completer && popd

if [[ ! -d $HOME/.vim/colors ]]; then
    mkdir $HOME/.vim/colors
fi


if [ ! -d $HOME/.vim/colors ]; then
  mkdir -p $HOME/.vim/colors
fi

curl https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim -o $HOME/.vim/colors/zenburn.vim

echo "Install powerline powerline-fonts"
