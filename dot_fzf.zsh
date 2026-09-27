# Homebrew installs fzf here on macOS; Debian, Ubuntu, and Fedora normally put
# it on PATH already.
if [ -d /opt/homebrew/opt/fzf/bin ] && [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="/opt/homebrew/opt/fzf/bin${PATH:+:${PATH}}"
fi

if command -v fzf >/dev/null 2>&1; then
  if fzf_zsh_init="$(fzf --zsh 2>/dev/null)"; then
    source <(print -r -- "$fzf_zsh_init")
  fi
  unset fzf_zsh_init
fi
