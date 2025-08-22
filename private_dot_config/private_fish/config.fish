if status is-interactive
    set fish_greeting

    if type "bat" &>/dev/null
        alias cat="bat"
    else if type "batcat" &>/dev/null
        alias cat="batcat"
    end

    zoxide init fish | source
    source (/usr/bin/starship init fish --print-full-init | psub)
end
