-- Configure Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
	    "git",
	    "clone",
	    "--filter=blob:none",
	    "https://github.com/folke/lazy.nvim.git",
	    "--branch=stable", -- latest stable release
	    lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
require("lazy").setup({
    -- Packer can manage itself
    'wbthomason/packer.nvim',

    -- show handy undotree with <leader>u
    'mbbill/undotree',

    -- operate git from nvim with <leader>gs
    'tpope/vim-fugitive',

    -- show git modifications inline
    'lewis6991/gitsigns.nvim',

    -- show nice status line
    'nvim-lualine/lualine.nvim',

    -- gcc to comment/uncomment line or block
    'tpope/vim-commentary',

    -- fuzzy finder, mostly with <leader>pf
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- cool theme
    "marko-cerovac/material.nvim",
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- context aware color highlighting
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- code completion without node
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    -- file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_hidden = false
                    }
                }
            })
        end
    },

    -- Adds extra functionality over rust analyzer
    "simrat39/rust-tools.nvim",

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
})
