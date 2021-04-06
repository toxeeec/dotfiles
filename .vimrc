set backspace=indent,eol,start
filetype plugin indent on
syntax on
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set nu
set relativenumber
set nowrap
set incsearch
set clipboard=unnamed
set laststatus=2
set noshowmode
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set hidden
set scrolloff=8
set signcolumn=yes
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ap/vim-css-color'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>u :update<CR>
nmap <leader>f <Plug>(coc-format)
nmap <leader>s <Plug>(coc-format) :update <CR>
nnoremap <leader>p :Files<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git/"'
