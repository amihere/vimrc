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

" colo retrobox

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
set scrolloff=10

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

" Keymaps

let mapleader = " "
" set timeoutlen 500

nmap <leader>ff :FZF<CR>

" delete single character without copying into register
" nmap x "_x<cr>

" window management
nmap <leader>\| <C-w>v " split window vertically

nmap <leader>- <C-w>s " split window horizontally
nmap <leader>q <C-w>q " close current split window
nmap <leader>w <C-w>w " toggle between open windows
nmap <leader>zz :silent LazyGit

" new wave
nmap <leader>fv :Oil

" moving lines up and down
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" move line below up, and keep cursor stationary
" nmap J mzJ`z

" keep cursor in middle while going up/down
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

" keep cursor in middle when searching
nmap n nzzzv
nmap N Nzzzv

" keeps original copied text when pasting over another selected text
nmap <leader>p :norm "_dP<cr>

" will copy text into both copy buffer and system clipboard
nmap Y y$
nmap <leader>y "+y<cr>
vmap <leader>y "+y<cr>
nmap <leader>Y "+Y<cr>
nmap <leader>d "_d<cr>
vmap <leader>d "_d<cr>

nmap Q <nop>

" keymap.set("x", "<leader>f", vim.lsp.buf.format)

nmap <C-n> :cnext<CR>zz
nmap <C-p> :cprev<CR>zz
nmap <leader>k :lnext<CR>zz
nmap <leader>j :lprev<CR>zz

nmap <leader>s :norm %s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nmap <leader>xx :!chmod +x %<CR>

nmap <leader><leader> :so<cr>

nmap <leader>o zi
nmap <leader>i za
nmap <leader>u :UndotreeToggle<cr>

" toggle line numbers
nmap <leader>ln :set rnu!<cr>

tmap <ESC> <C-\\><C-n>

function! LargeTerm()
  sp | term
  startinsert
endfunction

function! SmallTerm()
  5sp | term
  startinsert
endfunction

nmap <leader>tt :call LargeTerm()<cr>
nmap <leader>ts :call SmallTerm()<cr>

" "---------------------
" " Plugin Keybinds
" "---------------------

" Plugins
call plug#begin()
Plug 'mbbill/undotree'
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

