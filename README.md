# dotfiles (private)

- Personal dotfiles for a **CachyOS + niri (Wayland)** setup. Managed with a
plain `install.sh` (no external tools required) that symlinks everything
into `$HOME`.

- **This repo is private and contains real personal data** (noctalia
location, fcitx5-lotus macros/keymaps). A separate, sanitized copy with
those specific files redacted is what gets shared publicly — see the
"public" repo instead if you're not me.

- Specific:

| Type                 |  Name                                 |         
|----------------------|---------------------------------------|
| `Distro`             | CachyOS (or any arch bases)           |
| `DE / WM`            | niri                                  |
| `Environment`        | Wayland                               |
| `Shell`              | Fish (Noctalia shell)                 |

- Reference source: [laustoic's niri config](https://www.dropbox.com/scl/fo/xwjeeuv3wvqhnwwpkxhz9/ACSVE2_nFgNaQCgpNYBtIZ8?rlkey=475yrtu6v1h4v9xvv8n3ld6ul&st=yswpla9h&e=1&dl=0/)

*Or you can also see it in my repo at [reference](reference/laustoic-niri)*

## Layout

Each top-level folder is a **package** whose contents mirror `$HOME`.
`install.sh` reads a small manifest and symlinks each package's files/dirs
into the matching `$HOME` path — no stow, no dependency to install first.

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

```sh
git clone <this private repo url> ~/dotfiles
cd ~/dotfiles
./install.sh                   # links everything, bootstraps tpm
```

Selectively per machine:

```sh
./install.sh niri fish tmux    # only these packages
./install.sh --dry-run         # preview what would happen, no changes
./install.sh --unlink niri     # remove symlinks for a package
```

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

## Tmux customization

`install.sh` already `chmod +x`'s the scripts below and bootstraps tpm.
After installing, just run `tmux source ~/.config/tmux/tmux.conf` (or
restart tmux).

- `status-msg.sh`: shows the currently running command, or a time-of-day
  greeting when the shell is idle.
- `weather.sh`: fetches current temperature (15 min cache). Edit the city in
  the `wttr.in/<city>` URL inside the script to change location.
