return {
  -- add material theme
  { "marko-cerovac/material.nvim" },

  -- add tokyonight theme
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- add kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- NormalFloat = { bg = "none" },
          -- FloatBorder = { bg = "none" },
          -- FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
