# Sdrik's dotfiles

## Init on new host

```bash
git clone --bare git@github.com:sdrik/dotfiles ~/.config/dotfiles
git --git-dir ~/.config/dotfiles config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git --git-dir ~/.config/dotfiles fetch
alias dot='git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'
dot restore --staged .
```
