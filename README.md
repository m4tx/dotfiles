dotfiles
===========

Repo that contains my config files for some linux tools.

## Install

For Arch Linux:

```sh
pacman -S --noconfirm chezmoi && chezmoi init --apply m4tx
```

Or, for other distributions:

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply m4tx
```

After installing, the config can be easily updated by running `chezmoi update`.
