# Dotfiles

This directory is a chezmoi source tree for one shared set of dotfiles.

## Shared

- `private_dot_gitconfig.tmpl` - Git identity, Git LFS, SSH commit signing, and default branch settings with per-machine overrides.
- `dot_config/private_gh/private_config.yml` - GitHub CLI preferences and aliases.
- `dot_config/starship.toml` - Starship prompt layout, colors, symbols, and module settings.
- `dot_Rprofile` - R startup options, CRAN mirror, pak check, and startup message.
- `dot_profile` - POSIX shell profile that loads Cargo environment setup.

## macOS

- `dot_zprofile` - Zsh login setup for Homebrew and framework Python.
- `dot_zshenv` - Early Zsh environment setup for Cargo.
- `dot_zshrc` - Interactive Zsh setup for Homebrew, Oh My Zsh, fzf, zoxide, and Starship.
- `dot_config/private_fish/config.fish` - Fish PATH setup and interactive tool initialization.
- `dot_config/kitty/private_kitty.conf.tmpl` - Kitty IntoneMono Nerd Font, theme configuration, and macOS-only Fish shell launch setting.
- `dot_config/kitty/current-theme.conf` - Kitty color palette.
- `dot_config/rstudio/rstudio-prefs.json.tmpl` - RStudio editor, workspace, diagnostics, UI preferences, and templated terminal shell setting.
- `private_Library/private_Application Support/private_Code/private_User/settings.json.tmpl` - VS Code integrated terminal profile with templated Fish path.
- `private_Library/private_Application Support/private_Positron/private_User/settings.json.tmpl` - Positron integrated terminal profile with templated Fish path.

## Windows

- `Documents/PowerShell/Microsoft.PowerShell_profile.ps1.tmpl` - PowerShell 7 profile that can set machine-local UV environment variables, then initializes Starship, zoxide, eza helpers, fd-backed fzf defaults, and optional PSFzf keybindings.
- `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json` - Windows Terminal settings for PowerShell 7, IntoneMono Nerd Font, and the Hardcore color scheme.

The Windows PowerShell and Windows Terminal files are ignored on non-Windows
systems by `.chezmoiignore`. The macOS editor settings are ignored on non-macOS
systems.

## Setup

During initialization, choose a machine profile:

- `personal` for trusted personal macOS, Fedora, and Windows computers.
- `shared` for the shared Mac. It receives the Mac customizations and uses the
  1Password agent belonging to the signed-in macOS account. Initialization also
  records that Mac's Git identity and 1Password signing public key locally.
- `server` for Debian and Ubuntu servers. It receives shell configuration but
  no personal Git identity, GitHub CLI configuration, or desktop-app settings.
- `work` for the work Windows computer. It receives only the PowerShell profile.

Clone and apply these dotfiles with chezmoi. Use the SSH URL if the machine
already has GitHub SSH access:

```sh
chezmoi init git@github.com:vanderwhale/dotfiles.git
chezmoi diff
chezmoi apply
```

Use HTTPS on a fresh machine before SSH is set up:

```sh
chezmoi init https://github.com/vanderwhale/dotfiles.git
chezmoi diff
chezmoi apply
```

### macOS

Install Homebrew, then install the tools used by these dotfiles:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi fish starship zoxide fzf fd eza git git-lfs gh uv
brew install --cask kitty font-intone-mono-nerd-font visual-studio-code positron
```

Optional app setup:

```sh
$(brew --prefix)/opt/fzf/install
git lfs install
```

Then initialize and apply:

```sh
chezmoi init git@github.com:vanderwhale/dotfiles.git
chezmoi diff
chezmoi apply
```

### Windows

Install the core tools with winget from PowerShell:

```powershell
winget install -e --id twpayne.chezmoi
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Starship.Starship
winget install -e --id ajeetdsouza.zoxide
winget install -e --id eza-community.eza
winget install -e --id sharkdp.fd
winget install -e --id junegunn.fzf
winget install -e --id Git.Git
winget install -e --id GitHub.cli
winget install -e --id astral-sh.uv
```

Install the PowerShell fzf integration if you want the profile keybindings:

```powershell
Install-Module PSFzf -Scope CurrentUser
```

Install the IntoneMono Nerd Font on Windows. If winget does not provide it on
your machine, install `IntoneMonoNerdFontMono-Regular.ttf` and its variants
from Nerd Fonts manually.

Then initialize and apply:

```powershell
chezmoi init git@github.com:vanderwhale/dotfiles.git
chezmoi diff
chezmoi apply
```

### Debian

Install the packages available from Debian first:

```sh
sudo apt update
sudo apt install -y git git-lfs curl ca-certificates fish fzf fd-find zoxide gh
```

Debian often installs `fd` as `fdfind`. Add a local alias or symlink if needed:

```sh
mkdir -p ~/.local/bin
ln -s "$(command -v fdfind)" ~/.local/bin/fd
```

Install chezmoi with its upstream installer if it is not available from your
Debian repositories:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

Install Starship, eza, uv, and the Nerd Font using their current upstream
instructions when Debian's packaged versions are unavailable or too old. After
that:

```sh
chezmoi init git@github.com:vanderwhale/dotfiles.git
chezmoi diff
chezmoi apply
```

## Shell Defaults

- macOS login shell remains Zsh. These dotfiles do not run `chsh` or change the account login shell.
- Kitty on macOS launches Fish with `shell /opt/homebrew/bin/fish`.
- RStudio, VS Code, and Positron on macOS use Fish for their integrated terminals.
- Windows Terminal defaults to PowerShell 7 with `pwsh.exe`.
- macOS shells use the current account's 1Password SSH agent socket.
- Linux leaves `SSH_AUTH_SOCK` unchanged so local or explicitly forwarded agents
  continue to work.
- GitHub CLI uses SSH for Git operations on profiles where its configuration is
  managed; servers and work Windows machines do not receive that configuration.
- Kitty, RStudio, VS Code, and Positron select Fish on macOS only when the
  configured Fish executable exists at apply time.
- Apple Terminal's Basic profile uses IntoneMono Nerd Font Mono at 18pt with
  Hardcore foreground/background colors, so its Starship prompt matches Kitty.

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
| cyan | `#7f999f` |
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
gitSshSigningProgram = "C:/path/from/1Password/op-ssh-sign.exe"
gitGpgSign = true
manageGitConfig = true
kittyFontFamily = "IntoneMono Nerd Font Mono"
kittyFontSize = "18.0"
macFishPath = "/opt/homebrew/bin/fish"
macTerminalShell = "fish"
```

To leave a machine's existing `~/.gitconfig` unmanaged, set this only on that
machine:

```toml
[data]
manageGitConfig = false
```

For 1Password SSH commit signing, let 1Password store and authorize the private
key, then copy its **Configure Commit Signing** snippet into local chezmoi data.
Use the snippet's public key for `gitSigningKey` and its `gpg.ssh.program` path
for `gitSshSigningProgram`.

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
