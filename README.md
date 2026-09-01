# Notoxus Dotfiles

- Personal dotfiles for my Arch-based Linux environments.

## Specific:

| Type                 |  Name                                           |         
|----------------------|-------------------------------------------------|
| `Distro`             | Arch (or any Arch-base)                         |
| `DE / WM`            | Niri primary; KDE Plasma fallback; Umbriel experimental |
| `Environment`        | Wayland                                         |
| `Shell`              | Zsh + Starship + zoxide + fzf                   |

- Reference source: [laustoic's niri config](https://www.dropbox.com/scl/fo/xwjeeuv3wvqhnwwpkxhz9/ACSVE2_nFgNaQCgpNYBtIZ8?rlkey=475yrtu6v1h4v9xvv8n3ld6ul&st=yswpla9h&e=1&dl=0/)

*Or you can also see it in my repo at [reference](reference/laustoic-niri)*
---
## Configured keyboard shotcut (For my tilling config)

[Click here](keymap.md)
---
## Repo structure

Each top-level directory is a component whose contents mirror the location
they should occupy relative to `$HOME`.
```text
ghostty/
└── .config/
    └── ghostty/
        └── config.ghostty
```
Is linked to: **~/.config/ghostty/config.ghostty**

- To understand easily:

| Package     | Symlinks to                                   | What is it?                           |
|-------------|-----------------------------------------------|---------------------------------------|
| `niri`      | `~/.config/niri/`                             | primary compositor (optional install) |
| `noctalia`  | `~/.config/noctalia/`                         | primary Niri shell / bar (v4)         |
| `umbriel`   | `~/.config/umbriel/`                          | experimental compositor config        |
| `ghostty`   | `~/.config/ghostty/`                          | primary terminal                      |
| `zsh`       | `~/.config/zsh/` + `~/.zshenv`                | primary shell                         |
| `starship`  | `~/.config/starship.toml`                     | cross-shell prompt                    |
| `tmux`      | `~/.config/tmux/` (XDG)                       | tmux + status scripts                 |
| `alacritty` | `~/.config/alacritty/`                        | optional fallback terminal            |
| `micro`     | `~/.config/micro/`                            | editor                                |
| `input`     | `~/.config/{fcitx,fcitx5,ibus}/`              | input methods (Vietnamese/CJK)        |
| `desktop`   | `~/.config/{gtk-3.0,cachyos,...}`, mimeapps   | GTK, mime, user-dirs, misc            |
| `git`       | `~/.config/git/config` (XDG)                  | git config                            |

Application configuration lives under `~/.config/`. The only bootstrap file
at the top of `$HOME` is `~/.zshenv`, which sets `ZDOTDIR` so Zsh can discover
`~/.config/zsh/.zprofile` and `~/.config/zsh/.zshrc`. tmux (≥3.1) and git
(≥2.32) both fall back to `$XDG_CONFIG_HOME`
automatically when `~/.tmux.conf` / `~/.gitconfig` don't exist; tpm itself
also detects `~/.config/tmux/tmux.conf` and installs plugins under
`~/.config/tmux/plugins/` instead of `~/.tmux/`.

A few files inside `noctalia` and `input` are app-owned live state rather
than something you consciously author (noctalia's saved location, fcitx5's
typed macros/keymaps) — they're symlinked normally here since this repo is
private, but the **public** copy replaces just those with redacted samples
(same filenames, plain files, not symlinked/managed by its `install.sh` —
other users configure them by hand if they want to).

## Install (new machine)

```zsh
git clone https://github.com/notoxus/notoxus-dotfiles ~/dotfiles
cd ~/dotfiles
```

### List available components:

```zsh
./install.sh list
```
### Install a specific component

```zsh
./install.sh niri
```

### Install multiple components

```zsh
./install.sh zsh starship tmux ghostty
```

### Install all default components

```zsh
./install.sh all
```

**Conflict handling** — if something already exists at a target path:

- Existing files or symlinks are moved into a timestamped
  `~/.dotfiles-backup/<date>/` directory before linking.
- Nothing is merged or deleted automatically; compare backups manually before
  removing them.

The installer currently supports `list`, `all`, `--help`, and one or more
component names. Unlinking, restoring, and pruning backups are not implemented.

### Compositor roles

`umbriel`, `niri`, and `noctalia` are optional components: `./install.sh all`
does not install any of them. This repository only prepares configuration; it
does not install packages, enable services, change the display manager, or
replace the active KDE session.

Niri is the primary compositor and uses the existing Noctalia v4 configuration.
KDE remains the stable desktop fallback. Umbriel is kept only for experiments;
its config targets the Noctalia v5 IPC (`noctalia msg ...`) and should not
replace the working Niri/KDE sessions until its configuration stabilizes.

## Shell workflow

```text
Zsh
├── Starship                  prompt
├── zoxide                    directory jumping (`z`, `zi`)
├── fzf                       fuzzy history/files/directories
├── zsh-autosuggestions       history-based suggestions
└── zsh-syntax-highlighting   command-line validation/highlighting
```

Zsh uses its native completion system; Oh My Zsh and its Agnoster theme are no
longer part of the startup path. Every external integration is guarded, so a
missing package does not prevent Zsh from starting. The installer only links
configuration and does not install these dependencies.

## Terminal / tmux ownership

Ghostty is the primary terminal and owns:

- mouse selection and scrolling
- copy/paste
- terminal-level shortcuts

tmux is a keyboard-driven multiplexer and owns:

- sessions, windows, and panes
- detach/attach
- copy-mode history

The tmux configuration therefore uses:

```tmux
set -g mouse off
set -s set-clipboard external
```

Custom tmux workflow bindings live behind the `Ctrl+B` prefix, so applications
inside tmux remain free to use `Alt` and other non-prefixed shortcuts.

## tmux

### The tmux configuration includes

- Custom key bindings
- Status bar customization
- CPU and RAM information
- Weather information
- tmux-resurrect
- tmux-continuum
- TPM (Tmux Plugin Manager)

TPM is used to manage tmux plugins.

After installing the tmux configuration, start tmux and install the declared
plugins with:
**Ctrl + B**
and then:
**Prefix + I**

Plugins can be updated with:

**Prefix + U**

After modifying tmux.conf, reload it with:
```zsh
tmux source-file ~/.config/tmux/tmux.conf
```
Instead of (like regularly):
```zsh
source ~/.config/tmux/tmux.conf
```
tmux.conf is a tmux configuration file, not a shell script.

## Configuration Reloading

Different applications use different reload mechanisms.

Zsh
```zsh
source ~/.config/zsh/.zshrc
```

tmux

```zsh
tmux source-file ~/.config/tmux/tmux.conf
```
For other applications, restart the application when necessary.

## Notes

This repository is primarily designed for my own systems.

Some components may require additional packages, fonts, plugins, or
application-specific dependencies that are not installed automatically by
install.sh.

The installer intentionally focuses on one job:

select component
      ↓
backup conflicting files
      ↓
create symbolic links

It is not intended to be a complete system provisioning tool.

### What are these dependencies?

## License

Personal configuration files. Use whatever is useful.
