# Dependency installation guides

This page only points to upstream documentation. The dotfiles installer does
not download packages, run a package manager, or request root privileges.

Install only the software needed by the components you plan to use. Package
names and availability vary between distributions, so follow the relevant
upstream guide and your distribution's documentation.

## Terminal and shell

- [Ghostty installation](https://ghostty.org/docs/install/binary)
- [Nerd Fonts downloads](https://www.nerdfonts.com/font-downloads)
- [Zsh](https://www.zsh.org/)
- [Starship installation](https://starship.rs/guide/#installation)
- [fzf installation](https://github.com/junegunn/fzf#installation)
- [zoxide installation](https://github.com/ajeetdsouza/zoxide#installation)
- [Zsh Autosuggestions installation](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [Zsh Syntax Highlighting installation](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

## tmux

- [tmux installation](https://github.com/tmux/tmux/wiki/Installing)
- [TPM installation](https://github.com/tmux-plugins/tpm#installation)

TPM and its plugins are optional. Install them from inside tmux only when the
plugin functionality is wanted.

## Niri and Noctalia v4

- [Niri: Getting Started](https://github.com/niri-wm/niri/wiki/Getting-Started)
- [Quickshell installation](https://quickshell.org/docs/guide/install-setup/)
- [Noctalia Shell legacy v4 installation](https://docs.noctalia.dev/noctalia-shell-legacy/getting-started/installation/)

The tracked Niri configuration launches the legacy Quickshell-based Noctalia
v4 shell. Noctalia v5 uses a different runtime and command interface.

## Input method

- [Fcitx5 installation](https://fcitx-im.org/wiki/Install_Fcitx_5)
- [fcitx5-lotus](https://github.com/LotusInputMethod/fcitx5-lotus)

Both Fcitx5 and the fcitx5-lotus engine are needed for the tracked Vietnamese
input-method configuration.

## Umbriel and Noctalia v5

- [Umbriel documentation](https://docs.noctalia.dev/umbriel/)
- [Noctalia v5 installation](https://docs.noctalia.dev/noctalia/getting-started/installation/)

Umbriel support is experimental in this repository and its keybindings target
the Noctalia v5 command interface.

## Optional integrations

Run the read-only checker for component-specific optional integrations:

```sh
chmod +x ./install
./install check <component>
```

The checker reports missing commands or plugin files and prints their upstream
documentation links. It never installs anything.
