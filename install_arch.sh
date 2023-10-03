#!/bin/sh

paru -S antigen-git pkgfile fzf python-neovim autojump stow
sudo pkgfile --update
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

