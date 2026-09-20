return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost", -- Loads the plugin when you open a buffer
  init = function()
    -- These are the vim options from your snippet.
    -- We put them in 'init' so they load before the plugin starts.
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  keys = {
    -- Translating the vim.keymap.set into lazy.nvim's 'keys' format
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      desc = "Open all folds",
    },
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "Close all folds",
    },
  },
  opts = {
    -- This acts as require('ufo').setup()
    -- Option 3: treesitter as a main provider instead
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
}
