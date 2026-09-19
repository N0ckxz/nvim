require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Save, build CMake, run app in background, and stream stdout to toggleterm
map("n", "<F5>", function()
  vim.cmd "wa"

  -- Run command through `sh` so POSIX backgrounding syntax works cleanly regardless of your default shell
  local cmd =
    [[sh -c "cmake --build cmake-build-debug && > app.log && ./cmake-build-debug/grid > app.log 2>&1 & tail -f app.log"]]

  require("toggleterm").exec(cmd, 1)
end, { desc = "Build, Run OpenGL App, and View Live Terminal Logs" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
