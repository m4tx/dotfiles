alias u := update-all

update-pacman:
    paru -Syu --noconfirm

update-rust:
    rustup update

update-flatpak:
    flatpak update -y

update-all: update-pacman update-rust update-flatpak
