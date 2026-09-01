# Notoxus Dotfiles 🌸

Personal configuration for my Arch-based, Wayland desktop.

| Area | Current setup |
|---|---|
| Distribution | Arch Linux |
| Window Manager | Niri (primary), Umbriel (experimental) |
| Shell | Zsh with Starship, zoxide, and fzf |
| Terminal | Ghostty (daily tasks) and tmux (complex tasks) |
| Input method | Fcitx5 (fcitx5-lotus) |
| Home Manager | Nix (aspiring to use it soon!!!) |

`Why did I decide to adapt to Umbriel?`

- It's synchronized with the Noctalia shell, and I also think it's pretty 👍👍👍

## Repository layout

Each component directory mirrors its destination relative to `$HOME`. For
example:

```text
ghostty/.config/ghostty/config.ghostty
                     ↓
~/.config/ghostty/config.ghostty
```

| Component | Destination | Purpose |
|---|---|---|
| `desktop` | `~/.config/` | GTK, MIME associations, audio, and user directories (optional; may be detached soon =))) |
| `ghostty` | `~/.config/ghostty/` | Primary terminal |
| `git` | `~/.config/git/` | Git configuration and setup notes |
| `input` | `~/.config/fcitx5/` | Input method configuration |
| `niri` | `~/.config/niri/` | Primary compositor |
| `noctalia` | `~/.config/noctalia/` | Shell and bar for Niri |
| `starship` | `~/.config/starship.toml` | Shell prompt |
| `tmux` | `~/.config/tmux/` | Terminal multiplexer |
| `umbriel` | `~/.config/umbriel/` | Experimental compositor configuration |
| `zsh` | `~/.config/zsh/`, `~/.zshenv`, and `~/.local/bin/keys` | Shell and shortcut helper |

Most application configuration lives under `~/.config`. The `~/.zshenv`
bootstrap sets `ZDOTDIR`, allowing Zsh to load `~/.config/zsh/.zshrc`.

Some files under `noctalia` and `input` are application-managed state. Keep
private values out of public copies of this repository.

## Installation

The repository currently uses a small symlink installer. It only links
configuration; it does not install packages, enable services, or change the
active desktop session.

```zsh
git clone https://github.com/notoxus/notoxus-dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh list
```

Install one or more components:

```zsh
./install.sh zsh starship tmux ghostty
```

Install all default components:

```zsh
./install.sh all
```

`niri`, `noctalia`, and `umbriel` are optional and are skipped by `all`. Install
them explicitly when needed:

```zsh
./install.sh niri noctalia
```

If a destination already exists, the installer moves it into a timestamped
backup tree under `~/.dotfiles-backup/` before creating the symlink. The backup
preserves its path relative to `$HOME`, so files with the same basename do not
overwrite one another. The installer never merges or deletes existing
configuration automatically.

The empty `nix/` tree is reserved for learning Nix and a future Home Manager
migration. No Nix configuration is implemented yet. The first version should
stay single-machine and reuse the existing KDL, JSON, TOML, and shell files
instead of rewriting every application setting in Nix:

```text
nix/
├── flake.nix                 future entry point
├── hosts/
│   └── desktop/
│       └── default.nix       machine-level Arch/NixOS successor
├── profiles/
│   └── desktop.nix           packages and enabled home modules
└── modules/
    └── home/
        ├── niri.nix
        ├── noctalia.nix
        ├── ghostty.nix
        ├── tmux.nix
        └── zsh.nix
```

Keep `install.sh` until that future configuration can reproduce the current
setup on a clean machine; after that, the installer and this section can be
removed together.

## Shortcut discovery

Shortcut lists are generated from the applications instead of being duplicated
in a Markdown file, so they stay in sync with the installed versions.

After installing the `zsh` component, use:

```zsh
keys g
keys -n
keys t
```

- `keys g` opens a searchable list of Ghostty's default keybindings with fzf.
- `keys -n` opens a searchable list generated from the installed Niri config.
- `keys t` reminds you to press `Ctrl+B`, then `?`, for tmux's built-in help.
- In Niri, press `Mod+Shift+Esc` (`Mod` is the Super key) to open its hotkey
  overlay.

`keys g` requires `ghostty` and `fzf`; `keys -n` requires an installed Niri
config and falls back to plain output when `fzf` is unavailable; `keys t` only
prints the tmux reminder. The short options also accept `keys -g` and `keys -t`
for consistency.

## Shell workflow

```text
Zsh
├── Starship                  prompt
├── zoxide                    directory jumping (`z`, `zi`)
├── fzf                       history, file, and directory search
├── zsh-autosuggestions       history-based suggestions
└── zsh-syntax-highlighting   command-line highlighting
```

All external shell integrations are guarded, so a missing optional dependency
does not prevent Zsh from starting. Oh My Zsh is not part of the startup path.

Reload Zsh after editing its configuration:

```zsh
source ~/.config/zsh/.zshrc
```

## Ghostty and tmux

Ghostty owns terminal-level shortcuts and clipboard integration. tmux owns
sessions, windows, panes, and copy-mode history. The tmux prefix is `Ctrl+B`.

The tmux configuration includes custom bindings, a status bar, CPU and memory
indicators, weather, TPM, tmux-resurrect, and tmux-continuum. Mouse support is
enabled, and copy-mode can send copied text to the outer terminal clipboard.

Clipboard and selection work in both styles:

- Drag normally to select with tmux; releasing the mouse copies the selection.
- Hold `Shift` while dragging to use Ghostty's native selection instead.
- `Ctrl+Shift+C` and `Ctrl+Shift+V` remain Ghostty's copy/paste shortcuts.
- In tmux copy-mode, press `v` to select and `y` to copy.

Install TPM plugins from inside tmux with `Ctrl+B`, then `I`. Update them with
`Ctrl+B`, then `U`.

Reload the tmux configuration with:

```zsh
tmux source-file ~/.config/tmux/tmux.conf
```

`tmux.conf` is a tmux configuration file, not a shell script, so do not reload
it with the shell's `source` command.

## Compositor notes

Niri is the primary compositor and uses the Noctalia v4 configuration. Umbriel
is experimental and currently targets the Noctalia v5 IPC
(`noctalia msg ...`).

## License

Personal configuration files. Use whatever is useful.
