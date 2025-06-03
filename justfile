alias u := update-all
alias uu := update-all-and-reboot
alias up := update-all-and-poweroff

update-pacman:
    paru -Syu --noconfirm

update-rust:
    rustup update

update-cargo:
    cargo install --locked $(cargo install --list | grep -E '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')

update-flatpak:
    flatpak update -y

reboot:
    sudo systemctl reboot

poweroff:
    sudo systemctl poweroff

update-all: update-pacman update-rust update-cargo update-flatpak

update-all-and-reboot: update-all reboot

update-all-and-poweroff: update-all poweroff
