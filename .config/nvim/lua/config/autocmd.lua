vim.cmd("autocmd FileType * set formatoptions-=ro")

vim.cmd("autocmd FileType rust set colorcolumn=100")
vim.cmd("autocmd FileType go set colorcolumn=")
vim.cmd("autocmd BufNewFile,BufRead *.wgsl set filetype=wgsl")
vim.cmd("autocmd BufNewFile,BufRead *.wgsl set expandtab")

vim.cmd("autocmd FileType typescriptreact set wrap")
