# zsh

Powerful but tastefully minimal zsh configuration. No framework, no plugin manager overhead — just zsh.

## Structure

```
~/.config/zsh/        ← this repo (ZDOTDIR)
├── .zshenv           # XDG dirs, ZDOTDIR, PATH, EDITOR, STARSHIP_CONFIG
├── .zshrc            # history, completion, sources all modules
├── aliases.zsh       # command aliases (eza, bat, git, fd...)
├── bindings.zsh      # key bindings
├── fzf.zsh           # fzf configuration and commands
├── plugins.zsh       # minimal plugin manager (git clone + source)
├── prompt.zsh        # starship init
├── starship.toml     # starship prompt config
└── plugins/          # auto-created on first launch (gitignored)
```

## Dependencies (Ubuntu)

```bash
sudo apt install zsh neovim eza bat fd-find fzf ripgrep zoxide
curl -sS https://starship.rs/install.sh | sh

# Ubuntu name conflicts — symlink to standard names
ln -sf $(which batcat) ~/.local/bin/bat
ln -sf $(which fdfind) ~/.local/bin/fd
```

## Setup

**1. Clone into ZDOTDIR**

```bash
git clone https://github.com/afreisinger/zsh ~/.config/zsh
```

**2. Set ZDOTDIR system-wide** (so zsh finds the config before reading `~/.zshrc`)

Add to `/etc/zsh/zshenv`:

```zsh
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

**3. Create required directories**

```bash
mkdir -p ~/.local/state/zsh   # history
mkdir -p ~/.cache/zsh          # completion cache
```

**4. Set zsh as default shell**

```bash
chsh -s $(which zsh)
```

**5. Start a new shell** — plugins install automatically on first launch.

## Plugins

Managed without a third-party plugin manager. On first launch, `plugins.zsh` clones each plugin into `$ZDOTDIR/plugins/`.

| Plugin | Purpose |
|--------|---------|
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-style inline suggestions |
| [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) | Up/down arrow history filtering |
| [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) | Syntax highlighting |

To update all plugins:

```zsh
zplugin-update
```

## Key bindings

| Key | Action |
|-----|--------|
| `Ctrl+R` | Fuzzy history search (fzf) |
| `Ctrl+T` | Fuzzy file search (fzf + fd) |
| `Alt+C` | Fuzzy cd (fzf + fd) |
| `↑` / `↓` | History search by prefix |
| `Ctrl+→` | Move forward one word |
| `Ctrl+←` | Move backward one word |
| `Ctrl+\` | Toggle autosuggestions |

## Machine-local config

Create `~/.config/zsh/local.zsh` for machine-specific settings (not versioned):

```zsh
# Example: work proxy, nvm, pyenv, etc.
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
```
