# My Neovim Config

Focused on useful feature without too much trying to imitate an IDE.

## Installation

```bash
cd ~
git init
git remote add origin git@github.com:luander/dotfiles.git
git fetch
git checkout -f main
```

## Initial setup
From within Neovim:
```
:PackerSync
```
Restart Neovim to load all plugins and configurations

## Finding out keymaps
`:nmap` -> shows all key maps for normal mode
`:nmap <leader>` -> show all key maps for `<leader>`
`:verbose nmap <leader>` -> show all key maps and where is was set
`:Telescope keymaps` -> Open keymaps in Telescope
