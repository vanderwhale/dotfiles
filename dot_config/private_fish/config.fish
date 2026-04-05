if status is-interactive
    set -gx XDG_DATA_DIRS /opt/homebrew/share $XDG_DATA_DIRS
    zoxide init fish | source
    starship init fish | source
end
