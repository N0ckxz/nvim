require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<F5>", function()
  vim.cmd "wa"

  local cmd =
    "pkill -f grid || true; cmake -B cmake-build-debug -S . && cmake --build cmake-build-debug && ./cmake-build-debug/grid"

  require("toggleterm").exec(cmd, 1)
end, { desc = "Build and Run OpenGL App" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
