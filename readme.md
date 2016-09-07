# What is this

This is a technique used for managing dotfiles, making it easier to copy/work across various machines.

Totally stolen from https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

# Notes to self

To initially set this up (assuming zsh) do:

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

then start adding appropriate dotfiles:
```bash
config add .zshrc
config add .gitconfig
# etc
config commit -m "as appropriate"

# set an appropriate remote, and --set-upstream

config push
```



## On a new machine

```
# make sure that the .cfg is ignored
echo ".cfg" >> .gitignore
# clone into a bare repo
git clone --bare git@github.com:michael-forman/dotfiles.git $HOME/.cfg
# use the config alias to make it easier to work with the bare repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# We want to do a config checkout, but it will likely fail because
# we'll already have a .zshrc and .gitconfig in ~
# So, backup, then delete them (anything that will come from this repo)

config checkout

config config --local status.showUntrackedFiles no

```

