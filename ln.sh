#!/bin/bash

cd ~

dotdir=/LocalRun/wenjian.ma/dotfiles

rm .dotfiles
ln -s ${dotdir} .dotfiles

rm .bashrc
ln -s ~/.dotfiles/.bashrc .bashrc

rm .config
ln -s ~/.dotfiles/.config .config

rm .local
ln -s ~/.dotfiles/.local .local

rm .zshrc 
ln -s ~/.dotfiles/zsh/.zshrc .zshrc

rm .oh-my-zsh
ln -s ~/.dotfiles/zsh/.oh-my-zsh .oh-my-zsh

source .bashrc
source .zshrc
