#!/bin/bash

set -e

function check_prog {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}

check_prog stow
check_prog curl
check_prog git
check_prog zsh

############
# Printing #
############

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function print_msg {
	printf "$1"
}

function print_done {
	printf " ${GREEN}done${NC}\n"
}

function print_error {
	printf " ${RED}error${NC}\n"
}

function exec_cmd {
	print_msg "$2..."
	$1 && print_done || (print_error && exit 1)
}

###########
# Actions #
###########

function clone_repo {
	git clone --recursive https://github.com/m4tx/dotfiles "$HOME/.dotfiles" || (cd "$HOME/.dotfiles" && git pull)
	cd "$HOME/.dotfiles"
}

function stow_config {
	stow --target "$HOME" config
}

function install_systemd {
        sudo cp -R systemd/* /etc/systemd/
}

########
# Main #
########

exec_cmd clone_repo "Cloning the repository"
exec_cmd stow_config "Symlinking config"
exec_cmd install_systemd "Installing systemd services"

