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

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'
Plug 'Chiel92/vim-autoformat'
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
nnoremap <leader>u :update<CR>
nnoremap <leader>f :Autoformat<CR>
nnoremap gd :YcmCompleter GoToDefinition<CR>
nmap <leader>d <plug>(YCMHover)
nnoremap <F2> :YcmCompleter RefactorRename 
nnoremap <leader>p :Files<CR>

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git/"'
