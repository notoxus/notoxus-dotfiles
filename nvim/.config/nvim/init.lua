if vim.fn.has("nvim-0.11") == 0 then
  error("This configuration requires Neovim 0.11 or newer")
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Oil replaces netrw as the only file explorer.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("notoxus.options")
require("notoxus.keymaps")
require("notoxus.autocmds")
require("notoxus.lazy")
