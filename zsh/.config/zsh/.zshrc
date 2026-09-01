# ═══════════════════════════════════════════════════════════════════
#  Zsh configuration
#  ZDOTDIR is bootstrapped from ~/.zshenv
# ═══════════════════════════════════════════════════════════════════


# ── Paths ─────────────────────────────────────────────────────────
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)
export PATH


# ── History ───────────────────────────────────────────────────────
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY


# ── Completion & editing ──────────────────────────────────────────
bindkey -e

autoload -Uz compinit
compinit -d "$ZDOTDIR/.zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# ── fzf ───────────────────────────────────────────────────────────
# Ctrl+R → history
# Ctrl+T → files
# Alt+C  → directories
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:---height=40% --layout=reverse --border --info=inline}"

if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi


# ── zoxide ────────────────────────────────────────────────────────
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi


# ── Starship prompt ───────────────────────────────────────────────
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi


# ── Aliases ───────────────────────────────────────────────────────
alias bentopdf='docker run -d --rm --name bentopdf -p 3000:8080 ghcr.io/alam00000/bentopdf-simple:latest'


# ── Zsh plugins ───────────────────────────────────────────────────
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Keep syntax highlighting last.
if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
