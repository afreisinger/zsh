# =========================================================
# Aliases
# =========================================================

# --- navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# --- listing (eza over ls) ---
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first --git'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza --tree --icons --level=2'
else
  alias ls='ls --color=auto'
  alias ll='ls -alF'
  alias la='ls -A'
fi

# --- bat over cat ---
if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
elif command -v batcat >/dev/null 2>&1; then
  alias cat='batcat --paging=never'
fi

# --- fd (Ubuntu installs as fdfind) ---
if command -v fdfind >/dev/null 2>&1 && ! command -v fd >/dev/null 2>&1; then
  alias fd='fdfind'
fi

# --- git ---
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias glg='git log --oneline --decorate --graph --all'
alias gd='git diff'

# --- grep ---
alias grep='grep --color=auto'
alias rg='rg --smart-case'

# --- misc ---
alias vim='nvim'
alias v='nvim'
alias mux='tmuxinator'

# --- docker ---
# Limpieza segura: containers/imagenes/volumenes/cache sin uso.
# OJO: -a borra imagenes sin container y --volumes borra volumenes
# huerfanos (incluye el 'vscode' de dev containers). El codigo en el
# host no se toca; si, el estado dentro de Docker.
docker-clean() {
  command -v docker >/dev/null 2>&1 || { echo "docker no instalado"; return 1; }
  echo "== antes =="; docker system df
  docker container prune -f
  docker image prune -af
  docker volume prune -af
  docker builder prune -af
  echo "== despues =="; docker system df
  echo
  echo "Nota macOS: Docker.raw no se achica con prune."
  echo "Para devolver espacio al host: Docker Desktop > Troubleshoot > Clean/Purge data"
}

# Estado rapido del consumo de Docker
alias ddf='docker system df'
