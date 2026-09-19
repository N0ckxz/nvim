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
        "rust",
        "python",
      },
    },
  },
}
