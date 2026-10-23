dotfiles
===========

Repo that contains my config files for some linux tools.

## Install

For Arch Linux:

```sh
sudo pacman -S --noconfirm chezmoi && bash -c "chezmoi init --apply m4tx"
```

Or, for other distributions:

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply m4tx
```

After installing, the config can be easily updated by running `chezmoi update`.
