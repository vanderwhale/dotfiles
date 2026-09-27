# Homebrew installs fzf here on macOS; Debian, Ubuntu, and Fedora normally put
# it on PATH already.
if [ -d /opt/homebrew/opt/fzf/bin ] && [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="/opt/homebrew/opt/fzf/bin${PATH:+:${PATH}}"
fi

if command -v fzf >/dev/null 2>&1; then
  if fzf_bash_init="$(fzf --bash 2>/dev/null)"; then
    eval "$fzf_bash_init"
  fi
  unset fzf_bash_init
fi
