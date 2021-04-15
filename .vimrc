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
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'

call plug#end()

let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox

let mapleader = " "
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>w :update<CR>:q<CR>
nnoremap <silent><leader>u :update<CR>
nmap <silent><leader>f <Plug>(coc-format)
nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nnoremap <leader>p :Files<CR>
inoremap <silent><expr> <c-d> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

nnoremap <silent><leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git/"'
