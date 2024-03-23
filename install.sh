#!/bin/zsh

git submodule update --init --recursive

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sf ${PWD}/.zprezto ~/.zprezto
ln -sf ${PWD}/.vimrc ~/.vimrc
ln -sf ${PWD}/.zshrc ~/.zshrc
ln -sf ${PWD}/.zpreztorc ~/.zpreztorc
ln -sf ${PWD}/.vim ~/.vim

source ~/.zshrc
source ~/.zpreztorc
