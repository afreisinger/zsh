# =========================================================
# fzf configuration
# =========================================================

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git 2>/dev/null || find . -type f'
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --info=inline
  --bind ctrl-/:toggle-preview
'

# Ctrl+T: fuzzy file search (hidden included)
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude .git 2>/dev/null"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {} 2>/dev/null || cat {}'"

# Alt+C: fuzzy cd
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git 2>/dev/null"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --icons {} 2>/dev/null || ls {}'"

# Ctrl+R: fuzzy history (sorted by recency, no duplicates)
export FZF_CTRL_R_OPTS="--sort --exact"
