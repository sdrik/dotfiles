# Sdrik's dotfiles

## Init on new host

```bash
git clone --bare git@github.com:sdrik/dotfiles ~/.config/dotfiles
git --git-dir ~/.config/dotfiles config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git --git-dir ~/.config/dotfiles fetch
alias dot='git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'
dot restore --staged .
dot restore $(dot status --porcelain | grep '^ *D' | sed 's/^ *D //')
```

Analyze output of `dot diff` then `dot restore -p .` to restore missing chunks.

Launch `vim` to initialize vim-plug.
