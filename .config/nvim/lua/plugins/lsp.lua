return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        rust_analyzer = {
          keys = {
            { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
            { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
            { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
          },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
          require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
          return true
        end,
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    opts = function()
      local ok, mason_registry = pcall(require, "mason-registry")
      local adapter ---@type any
      if ok then
        -- rust tools configuration for debugging support
        local codelldb = mason_registry.get_package("codelldb")
        local extension_path = codelldb:get_install_path() .. "/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = ""
        if vim.loop.os_uname().sysname:find("Windows") then
          liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
        elseif vim.fn.has("mac") == 1 then
          liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
        else
          liblldb_path = extension_path .. "lldb/lib/liblldb.so"
        end
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
      end
      return {
        dap = {
          adapter = adapter,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
          on_initialized = function()
            vim.cmd([[
              augroup RustLSP
                autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
              augroup END
            ]])
          end,
        },
      }
    end,
  },
  -- {
  --   "mfussenegger/nvim-dap",
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   opts = function(_, opts)
  --     local dap, dapui = require("dap"), require("dapui")
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_hidden = false,
        },
      },
    },
  },
  -- code completion without node
  -- {
  --   "VonHeikemen/lsp-zero.nvim",
  --   dependencies = {
  --     -- LSP Support
  --     { "neovim/nvim-lspconfig" },
  --     { "williamboman/mason.nvim" },
  --     { "williamboman/mason-lspconfig.nvim" },
  --
  --     -- Autocompletion
  --     { "hrsh7th/nvim-cmp" },
  --     { "hrsh7th/cmp-buffer" },
  --     { "hrsh7th/cmp-path" },
  --     { "saadparwaiz1/cmp_luasnip" },
  --     { "hrsh7th/cmp-nvim-lsp" },
  --     { "hrsh7th/cmp-nvim-lua" },
  --
  --     -- Snippets
  --     { "L3MON4D3/LuaSnip" },
  --     { "rafamadriz/friendly-snippets" },
  --   },
  -- },
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- },
}
