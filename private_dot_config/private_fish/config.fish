if status is-interactive
    set fish_greeting

    if type "bat" &>/dev/null
        alias cat="bat"
    else if type "batcat" &>/dev/null
        alias cat="batcat"
    end

    set -U fish_user_paths $HOME/.local/bin

    zoxide init fish | source
end

source (/usr/bin/starship init fish --print-full-init | psub)

