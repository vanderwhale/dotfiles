if test -d /opt/homebrew/bin
    fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin
end

if test -d /usr/local/bin
    fish_add_path -g /usr/local/bin
end

if test -d /Applications/Docker.app/Contents/Resources/bin
    fish_add_path -g /Applications/Docker.app/Contents/Resources/bin
end

if test -d $HOME/.local/bin
    fish_add_path -g $HOME/.local/bin
end

if test -d /usr/local/texlive/2024/bin/x86_64-linux
    fish_add_path -g /usr/local/texlive/2024/bin/x86_64-linux
end

if test -f /opt/homebrew/etc/fish/config.fish
    source /opt/homebrew/etc/fish/config.fish
end

if test -f $HOME/.cargo/env.fish
    source $HOME/.cargo/env.fish
end

if status is-interactive
    if test -d /opt/homebrew/share
        set -gx XDG_DATA_DIRS /opt/homebrew/share $XDG_DATA_DIRS
    end

    if command -q conda
        conda shell.fish hook | source
    end

    if command -q zoxide
        zoxide init fish | source
    end

    if command -q starship
        starship init fish | source
    end
end
