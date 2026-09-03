local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true

opt.wrap = false
opt.breakindent = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.confirm = true

opt.termguicolors = true
opt.showmode = false
opt.laststatus = 3
opt.showtabline = 0
opt.winborder = "rounded"
opt.fillchars = { eob = " " }

opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
opt.pumheight = 12
opt.updatetime = 250
opt.timeoutlen = 400

vim.g.editorconfig = true

vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
  float = {
    border = "rounded",
    source = "if_many",
  },
})
