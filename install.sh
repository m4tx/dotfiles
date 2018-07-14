#!/bin/bash

set -e

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
	cd /tmp &&
	git clone --depth 1 -q https://github.com/m4tx/dotfiles &&
	cd dotfiles
}

function rm_repo {
	cd .. &&
	rm -Rf dotfiles
}

function copy_zshrc {
	cp .zshrc $HOME/
}

function copy_gitconfig {
	cp .gitconfig $HOME/
}

function copy_config {
	cp -R .config $HOME/
}

########
# Main #
########

exec_cmd clone_repo "Cloning the repository"

trap 'exec_cmd rm_repo "Removing the repository"' 0

exec_cmd copy_zshrc "Copying zshrc"
exec_cmd copy_gitconfig "Copying gitconfig"
exec_cmd copy_config "Copying .config"

