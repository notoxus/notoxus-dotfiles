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

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_SAVE_BY_COPY

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

unsetopt SHARE_HISTORY


# ── Completion & editing ──────────────────────────────────────────
bindkey -e

zmodload zsh/terminfo 2>/dev/null
if [[ -n "${terminfo[kdch1]-}" ]]; then
  bindkey -- "${terminfo[kdch1]}" delete-char
fi
bindkey -- $'\e[3~' delete-char

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


# ── Ghostty welcome ──────────────────────────────────────────────
# Show one system snapshot per Ghostty terminal, not again in tmux
# panes or when the current shell is reloaded.
if [[ -o interactive ]] \
  && [[ "${TERM_PROGRAM:-}" == "ghostty" || "${TERM:-}" == "xterm-ghostty" ]] \
  && [[ -z "${TMUX:-}" && -z "${NOTOXUS_FASTFETCH_SHOWN:-}" ]] \
  && (( $+commands[fastfetch] )); then
  export NOTOXUS_FASTFETCH_SHOWN=1
  fastfetch --config "${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch/config-mini.jsonc"
fi


# ── Aliases ───────────────────────────────────────────────────────
alias bentopdf='docker run -d --rm --name bentopdf -p 3000:8080 ghcr.io/alam00000/bentopdf-simple:latest'


# ── Zsh plugins ───────────────────────────────────────────────────
# Keep familiar commands from history, then fall back to context-aware
# completion for files, directories, options, and other arguments.
typeset -ga ZSH_AUTOSUGGEST_STRATEGY
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source_first_readable() {
  local candidate
  for candidate in "$@"; do
    if [[ -r "$candidate" ]]; then
      source "$candidate"
      return 0
    fi
  done
  return 1
}

source_first_readable \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Keep syntax highlighting last.
source_first_readable \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unfunction source_first_readable
