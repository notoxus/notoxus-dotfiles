# Notoxus Dotfiles 🌸

Personal ricing for my Wayland desktop.

| Area | Current setup |
|---|---|
| Distribution | Arch Linux (or NixOS, coz I use them in parallel) |
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
| `starship` | Starship |
| `tmux` | tmux; Git and lm-sensors are optional |
| `fastfetch` | Fastfetch and a Nerd Font |
| `nvim` | Neovim and Git; fzf, ripgrep, and a C compiler are optional |
| `yazi` | Yazi and a Nerd Font |
| `btop` | btop |
| `niri` | Niri and Noctalia v5 |
| `noctalia` | Noctalia v5 |
| `umbriel` | Umbriel and Noctalia v5 |


### Check dependencies

Before get started, inspect every component:

```sh
./install check all
```

Specific:

```sh
./install check <component 1> <component 2> <component ...>
```
[Click here!](docs/requirements.md)

### Copy files

Install the default components:

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

### Terminal workflow

`fastfetch`, `nvim`, and `yazi` are installed by `all`. `btop` remains a
specific component:

```sh
./install btop
```

`Mod + E` opens Yazi in Ghostty. In Zsh, use `y` to continue in the directory
selected in Yazi; quit Yazi with `q` to change directory or `Q` to keep the
current one.

### Optional command-line tools

`./install check zsh` also reports the optional `eza`, `lazygit`, `bat`,
`delta`, and `dust` utilities. Nothing is installed automatically. When `eza`
is present, Zsh provides:

```sh
tree
```

which runs `eza --tree --icons`.

On Arch Linux:

```sh
sudo pacman -Syu eza lazygit bat git-delta dust
```

### Some useful applications that I'd love

Including: OBS Studio, Rnote, Gaphor, LibreOffice, and Zotero.

If you use NixOS, you just have to uncomment them in /etc/nixos/vm/configuration.nix

BentoPDF for handling PDFs and Fcitx5 Lotus (Nguyen Ky) for Vietnamese typing:

- [BentoPDF](https://github.com/alam00000/bentopdf)
- [fcitx5-lotus](https://github.com/LotusInputMethod/fcitx5-lotus)

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
| `btop` | Resource monitor |
| `fastfetch` | Terminal system snapshot |
| `ghostty` | Primary terminal |
| `niri` | Primary compositor |
| `nvim` | Neovim configuration |
| `noctalia` | Shell and bar for Niri and Umbriel |
| `starship` | Shell prompt |
| `tmux` | Terminal multiplexer |
| `umbriel` | Experimental compositor |
| `yazi` | Terminal file manager |
| `zsh` | Shell configuration and the `keys` helper |

[Git and GitHub SSH setup guide](docs/git-ssh-setup.md)

## Doing workflow effectively

After installing the `zsh` component:

See [workflow notes](docs/workflow.md) for shell, tmux, clipboard, and compositor
details.
