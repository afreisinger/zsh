# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ZDOTDIR: zsh reads all its config from here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Pager: bat if available, fallback to less
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# GPG
export GPG_TTY=$(tty)

# Starship
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

# PATH: personal binaries first
export PATH="$HOME/.local/bin:$PATH"
