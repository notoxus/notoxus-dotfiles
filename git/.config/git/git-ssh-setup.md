# SSH setting up for initial config

## Download Git

sudo pacman -Sy git

## Setting up (Make sure you was logged into Github in your web browser)

```bash
git config --global user.name "Your Github Username"
git config --global user.email "ur-github-email@gmail.com"
```
## Recheck them
```bash
git config --global --list
```
## Setting some preferences (Optional)
```bash
git config --global init.defaultBranch main
git config --global core.editor "vim"
git config --global core.autocrlf input
git config --global color.ui auto
```
## Create SSH
### Check your SSH device setup
```bash
 ✘ juo@juosterben  ~/_DATA/Projects  ls -la ~/.ssh
total 12
drwx------  2 juo juo 4096 Aug 12 16:58 .
drwx------ 18 juo juo 4096 Aug 12 17:00 ..
-rw-r--r--  1 juo juo   92 Aug 12 16:58 known_hosts
```
### If you didn't have any, should generate it
```bash
 juo@juosterben  ~/_DATA/Projects  ssh-keygen -t ed25519 -C "ur-github-email@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/juo/.ssh/id_ed25519):
Enter passphrase for "/home/juo/.ssh/id_ed25519" (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/juo/.ssh/id_ed25519
Your public key has been saved in /home/juo/.ssh/id_ed25519.pub
The key fingerprint is:
<It'll appear here>
The key's randomart image is:
<And here>
```
### Start SSH agent and add key
```bash
 juo@juosterben  ~/_DATA/Projects  eval "$(ssh-agent -s)"
Agent pid <Your agent process ID>
# Add it to your id_ed25519 file
 juo@juosterben  ~/_DATA/Projects  ssh-add ~/.ssh/id_ed25519
Identity added: /home/juo/.ssh/id_ed25519 (to-ur-github-email)
# Let's try to see and  copy it
 juo@juosterben  ~/_DATA/Projects  cat ~/.ssh/id_ed25519.pub
<ur-new-SSH-agent-key><ur-github-email>
```
## Adding your SSH key to Github
Go to Github -> Your avatar (in the top-right conner) -> Setting -> SSH and GPG keys -> New SSH key
**you need to set that a name and paste your SSH key to the textboxs**
Okay, now check it again!!!
```bash
juo@juosterben  ~/_DATA/Projects  ssh -T git@github.com
Hi <ur-github-username>! You've successfully authenticated, but GitHub does not provide shell access.
```
If that message appears, you have succeeded. Otherwise, double-check your steps.
