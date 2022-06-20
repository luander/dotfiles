# dotfiles

The key for this repository to work is the `.gitignore` file. It has a `*` in it which tells git to ignore everything. The idea is that you clone this repo in your $HOME directory and nothing will ever be committed by mistake.
To add new files to this repository run:
```bash
git add -f <file>
```

# Installation

```bash
cd ~
git init
git remote add origin git@github.com:luander/dotfiles.git
git fetch
git checkout -f main
```


Inspired by: https://drewdevault.com/2019/12/30/dotfiles.html
