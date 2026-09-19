-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
  transparency = false,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

local header_art = [[

      ___           ___           ___           ___     
     /__/\         /  /\         /__/|         /  /\    
     \  \:\       /  /::\       |  |:|        /  /::|   
      \  \:\     /  /:/\:\      |  |:|       /  /:/:|   
  _____\__\:\   /  /:/  \:\   __|__|:|      /  /:/|:|__ 
 /__/::::::::\ /__/:/ \__\:\ /__/::::\____ /__/:/ |:| /\
 \  \:\~~\~~\/ \  \:\ /  /:/    ~\~~\::::/ \__\/  |:|/:/
  \  \:\  ~~~   \  \:\  /:/      |~~|:|~~      |  |:/:/ 
   \  \:\        \  \:\/:/       |  |:|        |  |::/  
    \  \:\        \  \::/        |  |:|        |  |:/   
     \__\/         \__\/         |__|/         |__|/    

]]

M.nvdash = {
  load_on_startup = true,

  header = vim.split(header_art, "\n"),
}

M.ui = {
  transparency = false,
  statusline = {
    theme = "minimal",
  },
  tabufline = {
    lazyload = false,
  },
}

return M
