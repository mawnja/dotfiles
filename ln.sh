#!/bin/bash

cd ~

dotdir=/LocalRun/wenjian.ma/dotfiles

rm .bashrc
ln -s ${dotdir}/.bashrc .bashrc

rm .config
ln -s ${dotdir}/.config .config

rm .local
ln -s ${dotdir}/.local .local

rm .vim
ln -s ${dotdir}/.vim .vim

rm .zshrc 
ln -s ${dotdir}/zsh/.zshrc .zshrc

rm .oh-my-zsh
ln -s ${dotdir}/zsh/.oh-my-zsh .oh-my-zsh

source .bashrc
source .zshrc
