# Dotfiles

This directory is a chezmoi source tree for one shared set of dotfiles.

## Shared

- `dot_gitconfig.tmpl` - Git identity, Git LFS, SSH commit signing, and default branch settings with per-machine overrides.
- `dot_config/gh/config.yml` - GitHub CLI preferences and aliases.
- `dot_config/starship.toml` - Starship prompt layout, colors, symbols, and module settings.
- `dot_Rprofile` - R startup options, CRAN mirror, pak check, and startup message.
- `dot_profile` - POSIX shell profile that loads Cargo environment setup.

## macOS

- `dot_zprofile` - Zsh login setup for Homebrew and framework Python.
- `dot_zshenv` - Early Zsh environment setup for Cargo.
- `dot_zshrc` - Interactive Zsh setup for Homebrew, Oh My Zsh, fzf, zoxide, and Starship.
- `dot_config/private_fish/config.fish` - Fish PATH setup and interactive tool initialization.
- `dot_config/kitty/kitty.conf.tmpl` - Kitty IntoneMono Nerd Font, theme configuration, and macOS-only Fish shell launch setting.
- `dot_config/kitty/current-theme.conf` - Kitty color palette.
- `dot_config/rstudio/rstudio-prefs.json.tmpl` - RStudio editor, workspace, diagnostics, UI preferences, and templated terminal shell setting.
- `Library/Application Support/Code/User/settings.json.tmpl` - VS Code integrated terminal profile with templated Fish path.
- `Library/Application Support/Positron/User/settings.json.tmpl` - Positron integrated terminal profile with templated Fish path.

## Windows

- `Documents/PowerShell/Microsoft.PowerShell_profile.ps1.tmpl` - PowerShell 7 profile that can set machine-local UV environment variables, then initializes Starship, zoxide, eza helpers, fd-backed fzf defaults, and optional PSFzf keybindings.
- `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json` - Windows Terminal settings for PowerShell 7, IntoneMono Nerd Font, and the Hardcore color scheme.

The Windows PowerShell and Windows Terminal files are ignored on non-Windows
systems by `.chezmoiignore`. The macOS editor settings are ignored on non-macOS
systems.

## Shell Defaults

- macOS login shell remains Zsh. These dotfiles do not run `chsh` or change the account login shell.
- Kitty on macOS launches Fish with `shell /opt/homebrew/bin/fish`.
- RStudio, VS Code, and Positron on macOS use Fish for their integrated terminals.
- Windows Terminal defaults to PowerShell 7 with `pwsh.exe`.

## Kitty Theme

| Name | Hex |
| --- | --- |
| background | `#121212` |
| foreground | `#a0a0a0` |
| cursor | `#bbbbbb` |
| selection background | `#453a39` |
| selection foreground | `#121212` |
| black | `#1b1d1e` |
| bright black | `#505354` |
| red | `#f92672` |
| bright red | `#ff669d` |
| green | `#a6e22e` |
| bright green | `#beed5f` |
| yellow | `#fd971f` |
| bright yellow | `#e6db74` |
| blue | `#66d9ef` |
| bright blue | `#66d9ef` |
| magenta | `#9e6ffe` |
| bright magenta | `#9e6ffe` |
| cyan | `#5e7175` |
| bright cyan | `#a3babf` |
| white | `#ccccc6` |
| bright white | `#f8f8f2` |

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

On a Windows machine that needs custom UV locations, add this only to that
machine's local `chezmoi.toml`:

```toml
[data.windowsUvEnvironment]
UV_CACHE_DIR = "D:\\uv\\cache"
UV_PYTHON_INSTALL_DIR = "D:\\uv\\python"
UV_TOOL_DIR = "D:\\uv\\tools"
```

## Commands

Preview changes:

```sh
chezmoi diff
```

Apply changes:

```sh
chezmoi apply
```
