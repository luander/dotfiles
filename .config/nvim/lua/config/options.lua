-- line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs & identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- persistent undo and more
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

-- termguicolors for theme to work
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- consider string-string as whole word
vim.opt.iskeyword:append("-")
vim.opt.isfname:append("@-@")

-- show 80 char column
-- vim.opt.colorcolumn = "80"

-- remap leader to <space> key
vim.g.mapleader = " "

-- backspace
-- allow backspace on indent, end of line or isert mode start position
vim.opt.backspace = "indent,eol,start"
