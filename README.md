# Notoxus Dotfiles 🌸

Personal configuration for my Arch-based Wayland desktop.

| Area | Current setup |
|---|---|
| Distribution | Arch Linux |
| Compositor | Niri (primary), Umbriel (experimental) |
| Desktop shell | Noctalia |
| Shell | Zsh, Starship, zoxide, and fzf |
| Terminal | Ghostty and tmux |
| Input method | Fcitx5 with fcitx5-lotus |

Umbriel is experimental here because it integrates with Noctalia—and it looks
pretty good 👍👍👍

## Installation

The installer only checks local dependencies and deploys configuration. It
never runs `sudo`, a package manager, `curl`, or an online installer.

```sh
git clone https://github.com/notoxus/notoxus-dotfiles ~/dotfiles
cd ~/dotfiles
./install list
./install check all
```

### Copy files (default)

Install the default terminal and shell components:

```sh
./install all
```

`all` includes `ghostty`, `starship`, `tmux`, and `zsh`. Desktop-specific
components are selected explicitly:

```sh
./install niri noctalia input
```

Copy mode is idempotent. If an existing destination differs, it is moved to a
timestamped tree under `~/.dotfiles-backup/` before the new file is copied.

### Symlink files (optional)

Use symlinks only when the repository should act as the live configuration:

```sh
./install --link zsh tmux ghostty
```

Preview either mode without changing `$HOME`:

```sh
./install --dry-run all
./install --link --dry-run niri noctalia
```

## Requirements

| Component | Main requirements |
|---|---|
| `ghostty` | Ghostty and a Nerd Font |
| `zsh` | Zsh; Starship, fzf, zoxide, and plugins are optional |
| `tmux` | tmux; Git and curl are optional |
| `niri` | Niri, Noctalia v4, Fcitx5, and GNOME Keyring |
| `noctalia` | Quickshell and Noctalia Shell legacy v4 |
| `input` | Fcitx5 and fcitx5-lotus |
| `umbriel` | Umbriel and Noctalia v5 |

If you do not already have these dependencies, follow their upstream
installation guides:

[Dependency installation guides](docs/requirements.md)

Run `./install check <component>` for a read-only check of required and
optional integrations.

## Repository layout

Each component mirrors its destination relative to `$HOME`:

```text
ghostty/.config/ghostty/config.ghostty
                     ↓
~/.config/ghostty/config.ghostty
```

| Component | Purpose |
|---|---|
| `desktop` | GTK, MIME, audio, and user-directory preferences |
| `ghostty` | Primary terminal |
| `git` | Git setup notes |
| `input` | Fcitx5 configuration |
| `niri` | Primary compositor |
| `noctalia` | Shell and bar for Niri |
| `starship` | Shell prompt |
| `tmux` | Terminal multiplexer |
| `umbriel` | Experimental compositor |
| `zsh` | Shell configuration and the `keys` helper |

Some files under `noctalia` and `input` are application-managed state. Keep
private values out of public copies of this repository.

## Shortcut discovery

After installing the `zsh` component:

```sh
keys g   # Ghostty defaults
keys n   # Installed Niri config
keys t   # tmux help reminder
```

Niri also provides its own overlay at `Mod+Shift+Esc`.

See [workflow notes](docs/workflow.md) for shell, tmux, clipboard, and compositor
details. The planned—but not implemented—Home Manager structure lives in the
[Nix layout note](docs/nix-layout.md).

## License

Personal configuration files. Use whatever is useful.
