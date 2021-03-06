#!/usr/bin/env bash

if [[ ! -d ~/.vim ]]; then
    mkdir ~/.vim
fi

if [[ ! -d ~/.vim/bundle ]]; then
    mkdir ~/.vim/bundle
fi

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf `pwd`/vimrc ~/.vimrc

vim +PluginInstall +qall

pushd $HOME/.vim/bundle/YouCompleteMe && ./install.py --clang-completer && popd

if [[ ! -d ~/.vim/colors ]]; then
    mkdir ~/.vim/colors
fi


if [ ! -d ~/.vim/colors ]; then
  mkdir -p ~/.vim/colors
fi

curl https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim -o $HOME/.vim/colors/zenburn.vim
