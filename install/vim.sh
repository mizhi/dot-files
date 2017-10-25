#!/usr/bin/env bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sf `pwd`/vimrc ~/.vimrc

vim +PluginInstall +qall

pushd $HOME/.vim/bundle/YouCompleteMe && ./install.py --clang-completer && popd 

curl https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim -o $HOME/.vim/colors/zenburn.vim
