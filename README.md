# Notoxus Dotfiles 🌸

Personal ricing for my Wayland desktop.

| Area | Current setup |
|---|---|
| Distribution | Arch Linux (or any Arch-based distro) --> expected to move to NixOS soon |
| Compositor | Niri (primary), Umbriel (experimental) |
| Desktop shell | Noctalia v5 |
| Shell | Zsh, Starship, zoxide, and fzf |
| Terminal | Ghostty and tmux |

`Why did I decide to adapt to Umbriel?`

- It's synchronized with the Noctalia shell, and I also think it's pretty 👍👍👍

## Installation

```sh
git clone https://github.com/notoxus/notoxus-dotfiles ~/dotfiles
cd ~/dotfiles
chmod +x ./install
./install list
```
## Requirements

| Component | Main requirements |
|---|---|
| `ghostty` | Ghostty and a Nerd Font |
| `zsh` | Zsh; Starship, fzf, zoxide, and plugins are optional |
| `tmux` | tmux; Git and lm-sensors are optional |
| `niri` | Niri and Noctalia v5 |
| `noctalia` | Noctalia v5 |
| `umbriel` | Umbriel and Noctalia v5 |

Run `./install check <component>` for check necessary dependency. If you do not already have these dependencies, follow their upstream installation guides:

[Click here!](docs/requirements.md)

### Check dependencies

Before get started, inspect every component:

```sh
./install check all
```

Specific:

```sh
./install check <component 1> <component 2> <component ...>
```

`check` is read-only and only reports what is present, missing, or needs manual
verification. Installation links are kept in
[the dependency guide](docs/requirements.md).

### Copy files

Install the default terminal and shell components:

```sh
./install all
```

Specific:

```sh
./install <component 1> <component 2> <component ...>
```

If an existing destination differs, it is moved to a
timestamped tree under `~/.dotfiles-backup/` before the new file is copied.

### Enable the Noctalia plugin

The `noctalia` component includes the local `notoxus/os-logo` plugin. After
copying the component, enable the plugin once:

```sh
./install noctalia
noctalia msg plugins enable notoxus/os-logo
```

Log out and back in after enabling it for the first time. A config reload may
not create a newly added plugin widget until the Noctalia session restarts.

### Install the tmux plugins

The tmux component declares `tmux-cpu`, `tmux-resurrect`, and
`tmux-continuum`. After installing TPM from the dependency guide, copy the
component, start tmux, then press `Ctrl+B` followed by `I`:

```sh
./install tmux
tmux
```

### Symlink files

- Use symlinks only when the repository should act as the live configuration:
- Each component mirrors its destination relative to `$HOME`:

`Ex:`

```text
ghostty/.config/ghostty/config.ghostty
                     ↓
~/.config/ghostty/config.ghostty
```

```sh
./install --link all
```
```sh
./install --link <component 1> <component 2> <component ...>
```

Preview either mode without changing `$HOME`:

```sh
./install --dry-run all
./install --link --dry-run <component 1> <component 2> <component ...>
```

## Repository layout

| Component | Purpose |
|---|---|
| `ghostty` | Primary terminal |
| `niri` | Primary compositor |
| `noctalia` | Shell and bar for Niri and Umbriel |
| `starship` | Shell prompt |
| `tmux` | Terminal multiplexer |
| `umbriel` | Experimental compositor |
| `zsh` | Shell configuration and the `keys` helper |

[Git and GitHub SSH setup guide](docs/git-ssh-setup.md)

## Shortcut discovery

After installing the `zsh` component:

See [workflow notes](docs/workflow.md) for shell, tmux, clipboard, and compositor
details.
