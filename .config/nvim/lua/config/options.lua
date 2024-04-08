vim.g.mapleader = " "

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.colorcolumn = "80"
opt.cursorline = true
opt.guicursor = ""
opt.ignorecase = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.showcmd = false
opt.showmode = false
opt.shiftwidth = 4
opt.signcolumn = "yes:2"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.updatetime = 100
opt.wrap = false

vim.g.omni_sql_no_default_maps = 1
vim.g.skip_ts_context_commentstring_module = true
