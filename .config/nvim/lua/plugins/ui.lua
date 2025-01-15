return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_hidden = false,
        },
        follow_current_file = {
          enable = true,
        },
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
  -- Configure nvim-notify background
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "m4xshen/smartcolumn.nvim",
  },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
}
