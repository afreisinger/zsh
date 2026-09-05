# =========================================================
# Key bindings
# =========================================================

# Ctrl+arrow: move word by word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Up/Down: history search by prefix (requires zsh-history-substring-search)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ctrl+\: toggle autosuggestions
_toggle_autosuggestions() {
  if [[ "${ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE}" == "none" ]]; then
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    zle autosuggest-enable
  else
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='none'
    zle autosuggest-disable
  fi
}
zle -N _toggle_autosuggestions
bindkey '^\' _toggle_autosuggestions
