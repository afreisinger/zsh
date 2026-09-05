# =========================================================
# Prompt — starship
# Config lives at $ZDOTDIR/starship.toml (via STARSHIP_CONFIG in .zshenv)
# =========================================================

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
