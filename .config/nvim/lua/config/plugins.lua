-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
-- Auto install packer if not installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- show handy undotree with <leader>u
    use 'mbbill/undotree'

    -- operate git from nvim with <leader>gs
    use 'tpope/vim-fugitive'

    -- show git modifications inline
    use 'lewis6991/gitsigns.nvim'

    -- smooth scrolling
    use 'karb94/neoscroll.nvim'

    -- show nice status line
    use 'nvim-lualine/lualine.nvim'

    -- use gcc to comment/uncomment line or block
    use 'tpope/vim-commentary'

    -- fuzzy finder, mostly with <leader>pf
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- cool theme
    use("marko-cerovac/material.nvim")
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- context aware color highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- code completion without node
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }

    -- file tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
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
    }

    -- Adds extra functionality over rust analyzer
    use("simrat39/rust-tools.nvim")

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    if is_bootstrap then
        require('packer').sync()
    end

end)
