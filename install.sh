#!/usr/bin/env bash
# install.sh — symlink these dotfiles into $HOME. No external deps (no stow).
#
# Usage:
#   ./install.sh                    # link everything
#   ./install.sh niri fish tmux     # only these packages
#   ./install.sh --dry-run          # preview, no changes
#   ./install.sh --unlink niri      # remove symlinks for a package
#
# Conflict handling: if something already lives at the target path,
#   - empty dir / empty (or missing) file -> replaced directly, nothing lost
#   - non-empty dir or real file          -> moved into a timestamped backup
#                                            folder, THEN linked. Nothing is
#                                            auto-merged; diff the backup by
#                                            hand if you want to keep parts
#                                            of your old config.
#
# Cleaning up old backups (once you've confirmed you don't need them):
#   ./install.sh --prune-backups         # preview: what's identical to the
#                                         # repo (safe to delete) vs what
#                                         # still differs (kept either way)
#   ./install.sh --prune-backups --yes   # actually delete the identical parts
#
# This is the PRIVATE copy (real personal data: noctalia location, fcitx5
# macros/keymaps included as-is). Do not make this repo/remote public.
set -euo pipefail
shopt -s nullglob

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# manifest entry: "package|path relative to repo package dir|path relative to \$HOME"
MANIFEST=(
  "niri|niri/.config/niri|.config/niri"
  "fish|fish/.config/fish|.config/fish"
  "alacritty|alacritty/.config/alacritty|.config/alacritty"
  "micro|micro/.config/micro|.config/micro"
  "noctalia|noctalia/.config/noctalia/colorschemes|.config/noctalia/colorschemes"
  "noctalia|noctalia/.config/noctalia/colors.json|.config/noctalia/colors.json"
  "noctalia|noctalia/.config/noctalia/plugins|.config/noctalia/plugins"
  "noctalia|noctalia/.config/noctalia/plugins.json|.config/noctalia/plugins.json"
  "noctalia|noctalia/.config/noctalia/settings.json|.config/noctalia/settings.json"
  "input|input/.config/fcitx|.config/fcitx"
  "input|input/.config/fcitx5/config|.config/fcitx5/config"
  "input|input/.config/fcitx5/profile|.config/fcitx5/profile"
  "input|input/.config/fcitx5/conf/lotus.conf|.config/fcitx5/conf/lotus.conf"
  "input|input/.config/fcitx5/conf/lotus-app-rules.conf|.config/fcitx5/conf/lotus-app-rules.conf"
  "input|input/.config/fcitx5/conf/notifications.conf|.config/fcitx5/conf/notifications.conf"
  "input|input/.config/fcitx5/conf/lotus-macro-table.conf|.config/fcitx5/conf/lotus-macro-table.conf"
  "input|input/.config/fcitx5/conf/lotus-custom-keymap.conf|.config/fcitx5/conf/lotus-custom-keymap.conf"
  "input|input/.config/ibus|.config/ibus"
  "desktop|desktop/.config/gtk-3.0|.config/gtk-3.0"
  "desktop|desktop/.config/gtk-4.0|.config/gtk-4.0"
  "desktop|desktop/.config/cachyos|.config/cachyos"
  "desktop|desktop/.config/mimeapps.list|.config/mimeapps.list"
  "desktop|desktop/.config/user-dirs.dirs|.config/user-dirs.dirs"
  "desktop|desktop/.config/user-dirs.locale|.config/user-dirs.locale"
  "desktop|desktop/.config/chrome-flags.conf|.config/chrome-flags.conf"
  "desktop|desktop/.config/cachyos-hello.json|.config/cachyos-hello.json"
  "desktop|desktop/.config/pavucontrol.ini|.config/pavucontrol.ini"
  "tmux|tmux/.config/tmux/tmux.conf|.config/tmux/tmux.conf"
  "tmux|tmux/.config/tmux/status-msg.sh|.config/tmux/status-msg.sh"
  "tmux|tmux/.config/tmux/weather.sh|.config/tmux/weather.sh"
  "git|git/.config/git/config|.config/git/config"
)
ALL_PACKAGES=(niri fish alacritty micro noctalia input desktop tmux git)

# ── parse args ──
DRY_RUN=0
UNLINK=0
PRUNE=0
CONFIRM=0
TARGETS=()
for arg in "$@"; do
  case "$arg" in
    --dry-run)       DRY_RUN=1 ;;
    --unlink)        UNLINK=1 ;;
    --prune-backups) PRUNE=1 ;;
    --yes)           CONFIRM=1 ;;
    -*) echo "Unknown flag: $arg" >&2; exit 1 ;;
    *) TARGETS+=("$arg") ;;
  esac
done
[[ ${#TARGETS[@]} -eq 0 ]] && TARGETS=("${ALL_PACKAGES[@]}")

is_selected() {
  local pkg="$1"
  for t in "${TARGETS[@]}"; do [[ "$t" == "$pkg" ]] && return 0; done
  return 1
}

is_empty_target() {
  local dst="$1"
  if [[ -d "$dst" && ! -L "$dst" ]]; then
    [[ -z "$(ls -A "$dst" 2>/dev/null)" ]]
  elif [[ -f "$dst" && ! -L "$dst" ]]; then
    [[ ! -s "$dst" ]]
  else
    return 1
  fi
}

link_one() {
  local src="$DOTFILES_DIR/$1" dst="$HOME/$2"

  if [[ "$UNLINK" -eq 1 ]]; then
    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
      echo "  - unlink $2"
      [[ "$DRY_RUN" -eq 1 ]] || rm -f "$dst"
    fi
    return
  fi

  if [[ -L "$dst" ]]; then
    if [[ "$(readlink "$dst")" == "$src" ]]; then
      echo "  = $2 (already linked)"
      return
    fi
    echo "  ~ $2 (relinking, was -> $(readlink "$dst"))"
    [[ "$DRY_RUN" -eq 1 ]] || rm -f "$dst"
  elif [[ -e "$dst" ]]; then
    if is_empty_target "$dst"; then
      echo "  - $2 (empty, replacing)"
      [[ "$DRY_RUN" -eq 1 ]] || rm -rf "$dst"
    else
      echo "  ! $2 (has existing content -> backing up)"
      if [[ "$DRY_RUN" -eq 0 ]]; then
        mkdir -p "$(dirname "$BACKUP_DIR/$2")"
        mv "$dst" "$BACKUP_DIR/$2"
      fi
      BACKED_UP+=("$2")
    fi
  fi

  [[ "$DRY_RUN" -eq 1 ]] || { mkdir -p "$(dirname "$dst")"; ln -sfn "$src" "$dst"; }
  echo "  + linked $2"
}

# ── prune old ~/.dotfiles-backup-*/ folders ──
# For every manifest entry present in a backup, diff it against the repo's
# current copy. Identical -> safe to delete (it's fully superseded by the
# live symlink). Different -> left alone; only a human should decide whether
# something unique in there is worth keeping.
prune_backups() {
  local backups=("$HOME"/.dotfiles-backup-*/)
  if [[ ${#backups[@]} -eq 0 ]]; then
    echo "No ~/.dotfiles-backup-* folders found. Nothing to prune."
    return
  fi

  local total_removed=0 total_kept=0

  for bk in "${backups[@]}"; do
    bk="${bk%/}"
    echo "Backup: $bk"
    for entry in "${MANIFEST[@]}"; do
      IFS='|' read -r pkg repo_rel home_rel <<< "$entry"
      local bpath="$bk/$home_rel"
      [[ -e "$bpath" ]] || continue
      if diff -rq "$DOTFILES_DIR/$repo_rel" "$bpath" >/dev/null 2>&1; then
        if [[ "$CONFIRM" -eq 1 ]]; then
          rm -rf "$bpath"
          echo "  - removed $home_rel (identical to repo)"
        else
          echo "  = $home_rel identical to repo (would remove)"
        fi
        total_removed=$((total_removed + 1))
      else
        echo "  ! $home_rel differs from repo -> kept, review by hand"
        total_kept=$((total_kept + 1))
      fi
    done

    if [[ "$CONFIRM" -eq 1 ]]; then
      find "$bk" -depth -type d -empty -delete 2>/dev/null || true
      if [[ ! -e "$bk" ]]; then
        echo "  -> fully redundant, backup folder removed"
      else
        echo "  -> kept at $bk (still has differing content above)"
      fi
    fi
    echo
  done

  echo "Identical: $total_removed item(s)   Differing (kept): $total_kept item(s)"
  [[ "$CONFIRM" -eq 0 ]] && echo "Preview only — re-run with --prune-backups --yes to actually delete."
}

if [[ "$PRUNE" -eq 1 ]]; then
  prune_backups
  exit 0
fi

echo "Dotfiles: $DOTFILES_DIR"
echo "Target:   $HOME"
echo "Packages: ${TARGETS[*]}"
[[ "$DRY_RUN" -eq 1 ]] && echo "Mode:     dry-run (no changes will be made)"
echo

BACKED_UP=()
for entry in "${MANIFEST[@]}"; do
  IFS='|' read -r pkg repo_rel home_rel <<< "$entry"
  is_selected "$pkg" || continue
  link_one "$repo_rel" "$home_rel"
done

# ── tmux script permissions + tpm bootstrap ──
# tpm lives under ~/.config/tmux/plugins/ (XDG) — tpm itself auto-detects
# ~/.config/tmux/tmux.conf and installs plugins there instead of ~/.tmux/.
if is_selected tmux && [[ "$UNLINK" -eq 0 && "$DRY_RUN" -eq 0 ]]; then
  chmod +x "$DOTFILES_DIR/tmux/.config/tmux/status-msg.sh" "$DOTFILES_DIR/tmux/.config/tmux/weather.sh"
  if [[ ! -d "$HOME/.config/tmux/plugins/tpm" ]]; then
    echo
    echo "  → installing tpm (tmux plugin manager)"
    git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
    echo "    Inside tmux, press: prefix + I  to install plugins."
  fi
fi

echo
if [[ ${#BACKED_UP[@]} -gt 0 ]]; then
  echo "Backed up ${#BACKED_UP[@]} item(s) with existing content to:"
  echo "  $BACKUP_DIR"
  printf '    %s\n' "${BACKED_UP[@]}"
  echo "Nothing was merged automatically — diff/merge by hand if you want to"
  echo "keep anything from your old config, then delete the backup."
fi
echo "Done."
