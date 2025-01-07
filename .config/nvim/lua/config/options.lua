vim.g.mapleader = " "

vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("update-formatoptions", { clear = true }),
	callback = function()
		vim.opt.formatoptions:remove({ "o" })
	end,
})
