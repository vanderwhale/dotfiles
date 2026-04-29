$starshipConfig = Join-Path $HOME ".config\starship.toml"
if (Test-Path $starshipConfig) {
    $env:STARSHIP_CONFIG = $starshipConfig
}

if (Get-Command fd -ErrorAction SilentlyContinue) {
    $env:FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git"
    $env:FZF_CTRL_T_COMMAND = $env:FZF_DEFAULT_COMMAND
}

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (&zoxide init powershell)
}

if (Get-Command eza -ErrorAction SilentlyContinue) {
    function ll { eza -lah --group-directories-first --icons @args }
    function la { eza -a --group-directories-first --icons @args }
    function lt { eza --tree --level=2 --group-directories-first --icons @args }
}

if ((Get-Command fd -ErrorAction SilentlyContinue) -and (Get-Command fzf -ErrorAction SilentlyContinue)) {
    function ff {
        fd --hidden --strip-cwd-prefix --exclude .git @args | fzf
    }

    function fcd {
        $directory = fd --type d --hidden --strip-cwd-prefix --exclude .git @args | fzf
        if ($directory) {
            Set-Location $directory
        }
    }
}

if (Get-Command fzf -ErrorAction SilentlyContinue) {
    if (Get-Module -ListAvailable -Name PSFzf) {
        Import-Module PSFzf
        Set-PsFzfOption -PSReadlineChordProvider "Ctrl+t" -PSReadlineChordReverseHistory "Ctrl+r"
    }
}

if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}
