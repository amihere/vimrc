set nocompatible

syntax on
filetype plugin on

" remove up and down
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"search all paths
set path+=**

"display matching files after tab
set wildmenu

colo retrobox

"line numbers
set relativenumber
set number

"tabs & indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"line wrapping
set nowrap

"search settings
set ignorecase
set smartcase

"cursor line
set guicursor=""

"appearance
set background=dark
set signcolumn=yes

"backspace
set backspace=indent,eol,start

"clipboard
"set clipboard+=unnamedplus

"split windows
set splitright
set splitbelow

"the prime aegean
set incsearch
set nohlsearch
set scrolloff=8

"TJ
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

let g:netrw_liststyle = 3

set foldlevelstart=1
set foldnestmax=2
set fml=3
set foldmethod=expr
set foldexpr="nvim_treesitter#foldexpr()"

" color scheme
colorscheme rosepine

call plug#begin()
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-test/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

