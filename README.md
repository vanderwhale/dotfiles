# Dotfiles

This directory is a chezmoi source tree for one shared set of dotfiles.

## Files

- `dot_bash_profile` - Loads `~/.bashrc` for login Bash shells.
- `dot_bashrc` - Bash PATH setup plus fzf, Cargo, zoxide, and Starship init.
- `dot_fzf.bash` - fzf shell integration for Bash.
- `dot_fzf.zsh` - fzf shell integration for Zsh.
- `dot_gitconfig.tmpl` - Git identity, Git LFS, SSH commit signing, and default branch settings with per-machine overrides.
- `dot_profile` - POSIX shell profile that loads Cargo environment setup.
- `dot_Rprofile` - R startup options, CRAN mirror, pak check, and startup message.
- `dot_zprofile` - Zsh login setup for Homebrew and framework Python.
- `dot_zshenv` - Early Zsh environment setup for Cargo.
- `dot_zshrc` - Interactive Zsh setup for Homebrew, Oh My Zsh, fzf, zoxide, and Starship.
- `dot_config/fish/config.fish` - Fish PATH setup and interactive tool initialization.
- `dot_config/gh/config.yml` - GitHub CLI preferences and aliases.
- `dot_config/kitty/current-theme.conf` - Kitty color palette.
- `dot_config/kitty/kitty.conf.tmpl` - Kitty IntoneMono Nerd Font, theme configuration, and macOS-only Fish shell launch setting.
- `dot_config/rstudio/rstudio-prefs.json.tmpl` - RStudio editor, workspace, diagnostics, UI preferences, and templated terminal shell setting.
- `dot_config/starship.toml` - Starship prompt layout, colors, symbols, and module settings.
- `Library/Application Support/Code/User/settings.json.tmpl` - macOS VS Code integrated terminal profile with templated Fish path.
- `Library/Application Support/Positron/User/settings.json.tmpl` - macOS Positron integrated terminal profile with templated Fish path.
- `Documents/PowerShell/Microsoft.PowerShell_profile.ps1` - Windows PowerShell 7 profile that points Starship at the shared config and initializes zoxide, eza helpers, fd-backed fzf defaults, and optional PSFzf keybindings.
- `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json` - Windows Terminal settings for PowerShell 7, IntoneMono Nerd Font, and the Hardcore color scheme.

The Windows PowerShell and Windows Terminal files are ignored on non-Windows
systems by `.chezmoiignore`. The macOS editor settings are ignored on non-macOS
systems.

## Shell Defaults

- macOS login shell remains Zsh. These dotfiles do not run `chsh` or change the account login shell.
- Kitty on macOS launches Fish with `shell /opt/homebrew/bin/fish`.
- RStudio, VS Code, and Positron on macOS use Fish for their integrated terminals.
- Windows Terminal defaults to PowerShell 7 with `pwsh.exe`.

Preview changes:

```sh
chezmoi --source ./chezmoi diff
```

Apply changes:

```sh
chezmoi --source ./chezmoi apply
```

Once this is moved to chezmoi's default source directory, the `--source ./chezmoi`
flag is no longer needed.

## Machine Overrides

Put per-machine values in `~/.config/chezmoi/chezmoi.toml`. These values are
local to each computer and are not committed to this repo.

```toml
[data]
gitName = "Sam"
gitEmail = "97985983+vanderwhale@users.noreply.github.com"
gitSigningKey = "ssh-ed25519 AAAA..."
gitGpgSign = true
kittyFontFamily = "IntoneMono Nerd Font Mono"
kittyFontSize = "14.0"
macFishPath = "/opt/homebrew/bin/fish"
macTerminalShell = "fish"
```
