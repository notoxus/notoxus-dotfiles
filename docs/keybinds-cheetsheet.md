# Keybinds cheatsheet

| Key | Meaning |
|---|---|
| `Mod` | `Super` |
| `Prefix` | `Ctrl + b` (tmux) |
| `Leader` | `Space` (Neovim) |

## Niri

| Shortcut | Action |
|---|---|
| `Mod + Shift + Esc` | Keybind overlay |
| `Mod + Return` | Ghostty |
| `Mod + Ctrl + Return` | Noctalia launcher |
| `Mod + B` | Firefox |
| `Mod + E` | Yazi in Ghostty |
| `Mod + Alt + L` | Lock screen |
| `Mod + Shift + Q` | Session menu |
| `Mod + Q` | Close window |
| `Mod + O` | Overview |
| `Mod + Shift + P` | Turn off monitors |
| `Ctrl + Alt + Delete` | Quit Niri |

| Shortcut | Focus / move |
|---|---|
| `Mod + ←/→/↑/↓` or `Mod + H/L/K/J` | Focus left/right/up/down |
| `Mod + Ctrl + ←/→/↑/↓` or `Mod + Ctrl + H/L/K/J` | Move left/right/up/down |
| `Mod + Home/End` | Focus first/last column |
| `Mod + Ctrl + Home/End` | Move column to first/last |
| `Mod + Shift + ←/→/↑/↓` | Focus monitor |
| `Mod + Ctrl + Shift + ←/→/↑/↓` | Move column to monitor |

| Shortcut | Workspace |
|---|---|
| `Mod + 1..9` | Focus workspace 1–9 |
| `Mod + Ctrl + 1..9` | Move column to workspace 1–9 |
| `Mod + Tab` | Previous workspace |
| `Mod + Wheel Up/Down` | Previous/next workspace |
| `Mod + Ctrl + Wheel Up/Down` | Move column to previous/next workspace |
| `Mod + Wheel Left/Right` | Focus column left/right |
| `Mod + Ctrl + Wheel Left/Right` | Move column left/right |

| Shortcut | Layout |
|---|---|
| `Mod + Ctrl + F` | Expand column to available width |
| `Mod + C` / `Mod + Ctrl + C` | Center column / visible columns |
| `Mod + ,` / `Mod + .` | Pull window into / push window out of column |
| `Mod + R` | Cycle preset column width |
| `Mod + -` / `Mod + =` | Decrease/increase column width |
| `Mod + Shift + -` / `Mod + Shift + =` | Decrease/increase window height |
| `Mod + T` | Toggle floating |
| `Mod + M` | Zoom / restore window |
| `Mod + F` | Toggle fullscreen |
| `Mod + W` | Toggle tabbed column |

| Shortcut | Media / display |
|---|---|
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | Volume up/down |
| `XF86AudioMute` / `XF86AudioMicMute` | Toggle output/mic mute |
| `XF86AudioPlay` / `XF86AudioPause` | Play/pause |
| `XF86AudioNext` / `XF86AudioPrev` | Next/previous track |
| `XF86MonBrightnessUp` / `XF86MonBrightnessDown` | Brightness up/down |

| Shortcut | Screenshot / recovery |
|---|---|
| `Ctrl + Shift + 1` | Screenshot region |
| `Ctrl + Shift + 2` | Screenshot screen |
| `Ctrl + Shift + 3` | Screenshot focused window |
| `Mod + Esc` | Release keyboard-shortcut inhibitor |

## tmux

| Shortcut | Action |
|---|---|
| `Prefix + r` | Reload tmux config |
| `Prefix + c` | New window in current directory |
| `Prefix + p` / `Prefix + n` | Previous/next window |
| `Prefix + Tab` | Last window |
| `Prefix + 1..9` | Select window 1–9 |
| `Prefix + X` | Kill current window |
| `Prefix + s` | Scratch session popup |

| Shortcut | Pane action |
|---|---|
| Prefix + \| | Split side-by-side |
| `Prefix + -` | Split top/bottom |
| `Prefix + h/j/k/l` | Focus pane left/down/up/right |
| `Prefix + H/J/K/L` | Resize pane left/down/up/right |
| `Prefix + Space` | Next layout |
| `Prefix + z` | Toggle pane zoom |
| `Prefix + x` | Kill current pane |

| Shortcut | Copy mode |
|---|---|
| `Prefix + Enter` | Enter copy mode |
| `v` | Start selection |
| `Ctrl + v` | Toggle rectangular selection |
| `y` | Copy selection |
| `Esc` | Cancel copy mode |

| Shortcut | TPM |
|---|---|
| `Prefix + I` | Install plugins |
| `Prefix + U` | Update plugins |

## Neovim

| Shortcut | Action |
|---|---|
| `-` | Open parent directory (Oil) |
| `Leader + w` / `Leader + q` / `Leader + Q` | Save / quit window / quit Neovim |
| `Esc` | Clear search highlight |
| `Ctrl + h/j/k/l` | Focus split left/down/up/right |
| `Leader + sv/sh` | Split vertically/horizontally |
| `Leader + se/sx` | Equalize / close splits |
| `]b` / `[b` | Next/previous buffer |
| `Leader + bd` | Delete buffer |
| `J` / `K` (visual) | Move selection down/up |
| `Leader + p` (visual) | Paste without replacing register |
| `Esc Esc` (terminal) | Leave terminal mode |

| Shortcut | Find |
|---|---|
| `Leader + ff` / `fg` | Find files / live grep |
| `Leader + fb` / `fr` | Buffers / recent files |
| `Leader + fw` / `fh` | Word under cursor / help tags |
| `Ctrl + q` (fzf-lua) | Select all and accept |

| Shortcut | Git / diagnostics / LSP |
|---|---|
| `]h` / `[h` | Next/previous Git hunk |
| `Leader + gs/gr/gp/gb/gd` | Stage/reset/preview/blame/diff hunk |
| `]d` / `[d` | Next/previous diagnostic |
| `Leader + le/lq` | Line diagnostic / diagnostic list |
| `gd/gD/gr/gI` | Definition/declaration/references/implementation |
| `K` | Hover documentation |
| `Leader + lr/la/lf/li` | Rename/code action/format/inlay hints |
| `Ctrl + Space` (insert) | Trigger completion |
| `Enter` / `Tab` / `Shift + Tab` (completion) | Accept / next / previous completion |
