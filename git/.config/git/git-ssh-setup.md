# Git and GitHub SSH setup

## Install Git

On Arch Linux:

```bash
sudo pacman -Syu git
```

## Set your identity

Use the name and email address you want attached to new commits:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Review the effective global configuration:

```bash
git config --global --list
```

Optional defaults:

```bash
git config --global init.defaultBranch main
git config --global core.editor micro
git config --global core.autocrlf input
git config --global color.ui auto
```

## Create an SSH key

Check for an existing public key first:

```bash
ls -la ~/.ssh
```

If you do not already have a suitable key, create an Ed25519 key. Use the email
address associated with your GitHub account:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

Accept the default path unless you intentionally manage multiple keys. A
passphrase is recommended.

Start an SSH agent for the current shell and add the private key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Print the public key—the `.pub` file is the one safe to copy to GitHub:

```bash
cat ~/.ssh/id_ed25519.pub
```

Never share `~/.ssh/id_ed25519`, which is the private key.

## Add the key to GitHub

In GitHub, open **Settings → SSH and GPG keys → New SSH key**, give the key a
descriptive title, and paste the complete public-key line.

Test authentication:

```bash
ssh -T git@github.com
```

On the first connection, verify and accept GitHub's host fingerprint. A success
message confirms authentication even though GitHub does not provide interactive
shell access.
