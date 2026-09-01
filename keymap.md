# Keymap Reference

P/s: `Mod` = `Super`.

---

## Niri (primary compositor)

Umbriel remains in the repository as an experimental alternative. `Mod` is
`Super` in the primary Niri session.

### Application

| Keyboard shortcut | Function |
|---|---|
| `Mod + Return` | Terminal (Ghostty) |
| `Mod + Ctrl + Return` | App Launcher (Noctalia) |
| `Mod + B` | Firefox |
| `Mod + E` | File Manager (Nautilus) |
| `Mod + Alt + L` | Lock screen (Noctalia) |
| `Mod + Shift + Q` | Session menu (Noctalia) |
| `Mod + Shift + Esc` | Show Niri hotkey overlay |

### Media & Brightness

| Keyboard shortcut | Function |
|---|---|
| `XF86AudioRaiseVolume` / `LowerVolume` | Volume Up/Down |
| `XF86AudioMute` | Mute audio |
| `XF86AudioMicMute` | Mute mic |
| `XF86AudioNext` / `Prev` | Next/previous track |
| `XF86AudioPlay` / `Pause` | Play/Pause |
| `XF86MonBrightnessUp` / `Down` | Brightness Up/Down |

### Focus & move windows

| Keyboard shortcut | Function |
|---|---|
| `Mod + Q` | Close windows |
| `Mod + ←/→/↑/↓` or `H/L/K/J` | Focus windows direction |
| `Mod + Ctrl + ←/→/↑/↓` or `H/L/K/J` | Move window/column in the workspace |
| `Mod + Home` / `End` | Focus first/last column |
| `Mod + Ctrl + Home` / `End` | Move column to first/last |
| `Mod + Shift + ←/→/↑/↓` | Focus monitor direction |
| `Mod + Shift + Ctrl + ←/→/↑/↓` | Move column to another monitor |

### Workspace

| Keyboard Shortcut | Function |
|---|---|
| `Mod + 1..9` | Switch workspace 1–9 |
| `Mod + Ctrl + 1..9` | Move window to workspace 1–9 |
| `Mod + Tab` | Previous Workspace |
| `Mod + Wheel Scroll` | Switch workspace |
| `Mod + Ctrl + Wheel Scroll` | Move window to workspace |
| `Mod + Wheel Left/Right` | Focus column direction |

### Layout

| Keyboard shortcut | Function |
|---|---|
| `Mod + Ctrl + F` | Expand column to available width |
| `Mod + C` | Center focused column |
| `Mod + Ctrl + C` | Center all visible columns |
| `Mod + -` / `=` | Decrease/increase window width (10%) |
| `Mod + Shift + -` / `=` | Decrease/increase window height (10%) |
| `Mod + T` | Toggle floating mode |
| `Mod + F` | Fullscreen |
| `Mod + W` | Toggle tabbed column display |
| `Mod + O` | Toggle overview |

### Screenshot & utility

| Keyboard shortcut | Function |
|---|---|
| `Ctrl + Shift + 1` | Select a screenshot region |
| `Ctrl + Shift + 2` | Screenshot the focused monitor |
| `Ctrl + Shift + 3` | Screenshot the focused window |
| `Mod + Esc` | Disable an active shortcut inhibitor |
| `Mod + Shift + P` | Turn screen off |
| `Ctrl + Alt + Delete` | Exit Niri |

---

## tmux

Prefix: `Ctrl + b` (Can change if you want :) )

### tmux ownership rule

tmux intentionally owns only workflow shortcuts behind the `Ctrl + b`
prefix. Ghostty owns mouse interaction, manual selection, copy/paste,
scrolling, and terminal-level shortcuts. tmux owns sessions, windows, panes,
detach/attach, and its optional keyboard-driven copy-mode history.

### Chung

| Keyboard shortcut | Function |
|---|---|
| `prefix + r` | Reload `tmux.conf` |
| `prefix + I` | Install plugin (tpm) |
| `prefix + U` | Update plugin (tpm) |

### Split & window

| Keyboard shortcut | Function |
|---|---|
| `prefix + \|` | Split horizontal (keep present window) |
| `prefix + -` | Split vertical (keep present window) |
| `prefix + c` | Create new window (keep present window) |
| `prefix + n/p` | Next/previous window |
| `prefix + Tab` | Back to previous used window |
| `prefix + 1..9` | Switch window directly 1–9 |
| `prefix + s` | Scratch popup session (75% width) |

### Pane direction (vim style)

| Keyboard shortcut | Function |
|---|---|
| `prefix + h/j/k/l` | Change pane direction |
| `prefix + H/J/K/L` (kept and repetitive) | Resize pane (±5) |

### Different Pane

| Keyboard shortcut | Function |
|---|---|
| `prefix + Space` | Change to a next window layout |
| `prefix + z` | Zoom pane |
| `prefix + x` | Kill pane (no confirmation) |
| `prefix + X` | Kill window (no confirmation) |

### Copy-mode (vim)

| Keyboard shortcut | Function |
|---|---|
| `prefix + Enter` | copy-mode |
| `v` | Start destination (copy-mode) |
| `Ctrl + v` | Choose follow rectangle shape |
| `y` | Copy selection (yank to system clipboard) |
| `Esc` | Cancel what u chose |

---

## Ghostty

| Keyboard shortcut | Function |
|---|---|
| Mouse drag | Select text and copy it automatically |
| `Ctrl + Shift + C` | Copy |
| `Ctrl + Shift + V` | Paste |
| `Shift + PageUp/PageDown` | Scroll up/down 1 page |

---

## micro (editor)

| Keyboard shortcut | Function |
|---|---|
| `Ctrl + S` | Save |
| `Ctrl + Q` | Exit |
| `Ctrl + Z` / `Ctrl + Y` | Undo / Redo |
| `Ctrl + C` / `Ctrl + V` | Copy / Paste |
| `Ctrl + F` | Search |
| `Ctrl + G` | Help |
| `Ctrl + E` | Command bar |
| `Alt + ←/→` | Switch tab |
