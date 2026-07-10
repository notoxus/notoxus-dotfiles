# Keymap Reference

P/s: `Mod` = `Super`.

---

## niri (WM)

### Application

| Keyboard shortcut | Function |
|---|---|
| `Mod + Return` | Terminal (Alacritty) |
| `Mod + Ctrl + Return` | App Launcher (noctalia) |
| `Mod + B` | Firefox |
| `Mod + E` | File Manager (Nautilus) |
| `Mod + Alt + L` | Lock screen |
| `Mod + Shift + Q` | Session Menu |
| `Mod + Shift + Esc` | Show overlay keyboard shortcut |

### Media & Brightness

| Keyboard shortcut | Function |
|---|---|
| `XF86AudioRaiseVolume` / `LowerVolume` | Volume Up/Down |
| `XF86AudioMute` | Mute audio |
| `XF86AudioMicMute` | Mute mic |
| `XF86AudioNext` / `Prev` | Play previous |
| `XF86AudioPlay` / `Pause` | Play/Pause |
| `XF86MonBrightnessUp` / `Down` | Brightness Up/Down |

### Focus & move windows

| Keyboard shortcut | Function |
|---|---|
| `Mod + Q` | Close windows |
| `Mod + ←/→/↑/↓` or `H/L/K/J` | Focus windows direction |
| `Mod + Ctrl + ←/→/↑/↓` or `H/L/K/J` | Move windows direction |
| `Mod + Home` / `End` | Focus home or end windows |
| `Mod + Ctrl + Home` / `End` | Switch home to end window |
| `Mod + Shift + ←/→/↑/↓` | Focus screen direction |
| `Mod + Shift + Ctrl + ←/→/↑/↓` | Move window to another one |

### Workspace

| Keyboard Shortcut | Function |
|---|---|
| `Mod + 1..9` | Switch workspace 1–9 |
| `Mod + Ctrl + 1..9` | Move window to workspace 1–9 |
| `Mod + Tab` | Previous Workspace |
| `Mod + Wheel Scroll` | Switch workspace |
| `Mod + Ctrl + Wheel Scroll` | Move window to workspace |
| `Mod + Wheel Left/Right` | Focus windows direction |

### Layout

| Keyboard shortcut | Function |
|---|---|
| `Mod + Ctrl + F` | Expand maximum width |
| `Mod + C` | Align centre |
| `Mod + Ctrl + C` | Căn giữa tất cả cột đang hiện |
| `Mod + -` / `=` | Increase/Decrease window width (10%) |
| `Mod + Shift + -` / `=` | Increase/Decrease window height (10%) |
| `Mod + T` | On/off floating mode |
| `Mod + F` | Fullscreen |
| `Mod + W` | On/off tab for window |
| `Mod + O` | On/off overview |

### Screenshot & utility

| Keyboard shortcut | Function |
|---|---|
| `Ctrl + Shift + 1` | Take screenshot full screen |
| `Ctrl + Shift + 2` | Take screenshot in one area |
| `Ctrl + Shift + 3` | Take screenshot in one window |
| `Mod + Esc` | Interrupt keyboard shortcut |
| `Mod + Shift + P` | Turn screen off |
| `Ctrl + Alt + Delete` | Exit niri |

---

## tmux

Prefix: `Ctrl + b` (Can change if you want :) )

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
| `prefix + Tab` | Back to previous used window |
| `Alt + 1..9` | Switch window directly 1–9 |
| `Alt + Enter` | Scratch popup session (account for 75%) |

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
| `prefix + x` | Kill pane (Ask) |
| `prefix + X` | Kill window (Dont ask) |

### Copy-mode (vim)

| Keyboard shortcut | Function |
|---|---|
| `prefix + Enter` | copy-mode |
| `v` | Start destination (copy-mode) |
| `Ctrl + v` | Choose follow rectangle shape |
| `y` | Copy selection (yank to system clipboard) |
| `Esc` | Cancel what u chose |

---

## Alacritty

| Keyboard shortcut | Function |
|---|---|
| `Ctrl + Shift + C` | Copy |
| `Ctrl + Shift + V` | Paste |
| `Ctrl + Shift + F` | Forward search |
| `Ctrl + Shift + B` | Reverse search |
| `Ctrl + L` | Clear terminal screen |
| `Ctrl + 0` | Reset size to default |
| `Shift + PageUp/PageDown` | Scroll up/down 1 page |
| `Shift + Home/End` | Scroll home or end buffer |
| `Shift + Enter` | Send newline literal (TUI/REPL) |
| `Ctrl + Shift + C` (Vi mode) | Clear selection |
|  Centre mouse | Paste từ selection |

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
