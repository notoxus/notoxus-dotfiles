# Workflow notes

## Shell

```text
Zsh
├── Starship                  prompt
├── zoxide                    directory jumping (`z`, `zi`)
├── fzf                       history, file, and directory search
├── zsh-autosuggestions       history-based suggestions
└── zsh-syntax-highlighting   command-line highlighting
```

Reload the configuration with:

```sh
source ~/.config/zsh/.zshrc
```

## Shortcut discovery

```sh
keys g
keys n
keys t
```

- `keys g` searches Ghostty's default keybindings with fzf.
- `keys n` searches the installed Niri configuration and falls back to plain
  output when fzf is unavailable.
- `keys t` reminds you how to open tmux's built-in keybinding help.

## Ghostty and tmux

Ghostty owns terminal shortcuts and clipboard integration. tmux owns sessions,
windows, panes, and copy-mode history. Its prefix is `Ctrl+B`.

- Drag normally to select with tmux; releasing the mouse copies the selection.
- Hold `Shift` while dragging to use Ghostty's native selection.
- `Ctrl+Shift+C` and `Ctrl+Shift+V` remain Ghostty's copy/paste shortcuts.
- In tmux copy-mode, press `v` to select and `y` to copy.

Install TPM plugins with `Ctrl+B`, then `I`; update them with `Ctrl+B`, then
`U`. Reload the tmux configuration with:

```sh
tmux source-file ~/.config/tmux/tmux.conf
```
