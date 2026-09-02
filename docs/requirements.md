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

## Niri and Noctalia v5

- [Niri: Getting Started](https://github.com/niri-wm/niri/wiki/Getting-Started)
- [Noctalia v5 installation](https://docs.noctalia.dev/noctalia/getting-started/installation/)

The tracked Niri configuration launches Noctalia directly and uses its v5
`noctalia msg` command interface.

## Umbriel

- [Umbriel documentation](https://docs.noctalia.dev/umbriel/)

Umbriel support is experimental in this repository and its keybindings target
the same Noctalia v5 command interface.

## Optional integrations

- [Fcitx5 installation](https://fcitx-im.org/wiki/Install_Fcitx_5)
- [fcitx5-lotus](https://github.com/LotusInputMethod/fcitx5-lotus)

Fcitx5 can be configured locally when Vietnamese input is needed. Its generated
profiles and application state are not tracked by this repository.

Run the read-only checker for component-specific optional integrations:

```sh
chmod +x ./install
./install check <component>
```

The checker reports missing commands or plugin files and prints their upstream
documentation links. It never installs anything.
