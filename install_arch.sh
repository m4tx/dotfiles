#!/bin/sh

pacaur -S antigen-git pkgfile
sudo pkgfile --update
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

