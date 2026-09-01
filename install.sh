#!/usr/bin/env bash
# Modular dotfiles installer.
#
# Usage:
#   ./install.sh <component> [component...]
#   ./install.sh all
#   ./install.sh list
#   ./install.sh --help
#
# Convention:
# Each top-level component directory mirrors the path its files should
# occupy relative to $HOME.
#
# Examples:
#   zsh/.zshrc
#       -> ~/.zshrc
#
#   tmux/.config/tmux/tmux.conf
#       -> ~/.config/tmux/tmux.conf

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# Components that should not be installed by `./install.sh all`.
OPTIONAL_COMPONENTS=(
  "niri"
  "noctalia"
  "umbriel"
)


usage() {
  cat <<EOF
Usage:
  $0 <component> [component...]
  $0 all
  $0 list
  $0 --help

Commands:
  list        List available components
  all         Install all default components
  --help      Show this help message

Examples:
  $0 zsh
  $0 tmux ghostty
  $0 all
EOF
}


is_excluded() {
  local name="$1"

  # Repository metadata and local agent state are never installable components.
  [[ "$name" == .* ]] && return 0

  return 1
}


is_optional() {
  local name="$1"

  for optional in "${OPTIONAL_COMPONENTS[@]}"; do
    [[ "$name" == "$optional" ]] && return 0
  done

  return 1
}


get_components() {
  local dir

  for dir in "$DOTFILES_DIR"/*/; do
    [[ -d "$dir" ]] || continue
    [[ -n "$(find "$dir" -type f -print -quit)" ]] || continue

    basename "$dir"
  done | sort
}


list_components() {
  echo "Default components:"

  while IFS= read -r name; do
    is_excluded "$name" && continue
    is_optional "$name" && continue

    echo "  $name"
  done < <(get_components)

  echo
  echo "Optional components:"

  while IFS= read -r name; do
    is_excluded "$name" && continue
    is_optional "$name" || continue

    echo "  $name"
  done < <(get_components)
}


link_file() {
  local src="$1"
  local dest="$2"
  local backup

  mkdir -p "$(dirname "$dest")"

  # Already correctly linked -> no-op.
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "  [ok]      $dest"
    return
  fi

  # Something else exists at the destination -> back it up.
  if [[ -e "$dest" || -L "$dest" ]]; then
    backup="$BACKUP_DIR/${dest#"$HOME"/}"
    mkdir -p "$(dirname "$backup")"

    mv "$dest" "$backup"

    echo "  [backup]  $dest -> $backup"
  fi

  ln -s "$src" "$dest"

  echo "  [linked]  $dest -> $src"
}


install_component() {
  local component="$1"
  local component_dir="$DOTFILES_DIR/$component"

  if [[ ! -d "$component_dir" ]] ||
     is_excluded "$component" ||
     [[ -z "$(find "$component_dir" -type f -print -quit)" ]]; then
    echo "Unknown component: $component" >&2
    echo >&2
    echo "Available components:" >&2
    list_components >&2
    exit 1
  fi

  echo "Installing: $component"

  while IFS= read -r -d '' file; do
    local rel="${file#"$component_dir"/}"
    link_file "$file" "$HOME/$rel"
  done < <(find "$component_dir" -type f -print0)
}


# No arguments -> show usage.
[[ $# -eq 0 ]] && {
  usage
  exit 1
}


case "$1" in
  list)
    list_components
    exit 0
    ;;

  all)
    while IFS= read -r name; do
      is_excluded "$name" && continue

      # Skip optional components when installing everything.
      is_optional "$name" && continue

      install_component "$name"
    done < <(get_components)

    exit 0
    ;;

  --help|-h)
    usage
    exit 0
    ;;
esac


# Install explicitly requested components.
for component in "$@"; do
  install_component "$component"
done
