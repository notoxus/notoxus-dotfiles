# Notoxus Dotfiles

- Personal dotfiles for my Arch-based Linux environments.

- The repository uses a small custom installer to manage configuration files
through symbolic links. Each component is independent and can be installed
without relying on a dotfile manager such as GNU Stow or chezmoi.

## Specific:

| Type                 |  Name                                           |         
|----------------------|-------------------------------------------------|
| `Distro`             | Arch (or any Arch-base)                         |
| `DE / WM`            | KDE plasma and niri (if you like tilling style) |
| `Environment`        | Wayland                                         |
| `Shell`              | zsh (Noctalia shell if you use tilling config)  |

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
        └── config
```
Is linked to: **~/.config/ghostty/conf.ghostty**

- To understand easily:

| Package     | Symlinks to                                   | What is it?                           |
|-------------|-----------------------------------------------|---------------------------------------|
| `niri`      | `~/.config/niri/`                             | niri WM (split into `cfg/*.kdl`)      |
| `noctalia`  | `~/.config/noctalia/`                         | noctalia shell / bar                  |
| `fish`      | `~/.config/fish/`                             | fish shell config                     |
| `tmux`      | `~/.config/tmux/` (XDG)                       | tmux + status scripts                 |
| `alacritty` | `~/.config/alacritty/`                        | terminal                              |
| `micro`     | `~/.config/micro/`                            | editor                                |
| `input`     | `~/.config/{fcitx,fcitx5,ibus}/`              | input methods (Vietnamese/CJK)        |
| `desktop`   | `~/.config/{gtk-3.0,cachyos,...}`, mimeapps   | GTK, mime, user-dirs, misc            |
| `git`       | `~/.config/git/config` (XDG)                  | git config                            |

Everything lives under `~/.config/` — nothing scattered at the top of
`$HOME`. tmux (≥3.1) and git (≥2.32) both fall back to `$XDG_CONFIG_HOME`
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
### Install a specific component:
```zsh
./install.sh --unlink niri     # remove symlinks for a package
```
### Mutiple ones
```zsh
./install.sh zsh tmux ghostty
```
### All of them (That script may chose config files properly)
./install.sh all

**Conflict handling** — if something already exists at a target path:
- empty dir / empty or missing file → replaced directly, nothing lost.
- real existing content → moved into a timestamped
  `~/.dotfiles-backup-<date>/` folder, *then* linked. Nothing is merged
  automatically; diff the backup by hand if you want to keep anything from
  your old config.

Once you've confirmed a backup isn't needed, `./install.sh --prune-backups`
previews which backed-up items are byte-identical to the repo (safe to
delete) vs which still differ (kept either way); add `--yes` to actually
delete the identical ones.
tmux

## The tmux configuration includes:

- Custom key bindings
- Status bar customization
- CPU and RAM information
- Weather information
- tmux-resurrect
- tmux-continuum
- TPM (Tmux Plugin Manager)
- TPM

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

## Clipboard

The current Ghostty + tmux setup uses (to avoid clipboard conflict):
```zsh
set -g set-clipboard off
```
This avoids duplicate paste behavior with Ghostty's clipboard handling.

## Configuration Reloading

Different applications use different reload mechanisms.

Zsh
```zsh
source ~/.zshrc
tmux
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
