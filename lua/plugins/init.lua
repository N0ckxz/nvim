return {
  -- Formatter configuration
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Enable format on save
    opts = require "configs.conform",
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
      floating_window = true,
      hint_enable = false, -- Set to true if you want inline parameter hints
    },
  },

  -- Auto-install tools via Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        "clangd", -- C / C++
        "rust-analyzer", -- Rust
        "glslls", -- GLSL Language Server for shader completion/errors
        "pyright", -- Python

        -- Formatters & Linters
        "clang-format", -- C / C++ formatter
        "black", -- Python formatter
        "ruff", -- Python linter
        "mypy", -- Python type checker
      },
    },
  },

  -- Rust configuration
  -- Cargo.toml autocomplete and version status
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- High-performance Rust LSP & tooling
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, -- Plugin manages its own lazy loading
  },

  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
    -- config = function()
    --     require("nvim-surround").setup({
    --         -- Put your configuration here
    --     })
    -- end
  },

  -- Quick toggleable terminal for running CMake & Binaries
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
    opts = {
      direction = "float",
      open_mapping = [[<c-\>]],
    },
  },

  -- Debuging for OpenGl/C++
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminate["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
        "glsl",
        "rust",
        "python",
      },
    },
  },
}
