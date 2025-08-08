#!/bin/bash

cd /tmp

ln -s /LocalRun/usr local

cd ~

rm local
ln -s /tmp/local local

rm .bashrc
ln -s ~/local/dotfiles/.bashrc .bashrc

rm .config
ln -s ~/local/dotfiles/.config .config

rm .local
ln -s ~/local/dotfiles/.local .local

rm .zshrc 
ln -s ~/local/dotfiles/zsh/.zshrc .zshrc

source .bashrc
source .zshrc
