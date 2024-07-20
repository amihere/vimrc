set nocompatible

syntax on
filetype plugin on

" remove up and down
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set completeopt=menuone,noinsert,noselect,preview

"search all paths
" set path+=**

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
set clipboard^=unnamed,unnamedplus

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

nmap <leader>ff :Files!<CR>
nmap <leader>fg :GFiles!<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fm :Maps<CR>
nmap <leader>fhs :History/<CR>
nmap <leader>fhc :History:<CR>

" delete single character without copying into register
nnoremap x "_x

" window management
nmap <leader>\| <C-w>v " split window vertically
nmap <leader>- <C-w>s " split window horizontally
nmap <leader>q <C-w>q " close current split window
nmap <leader>w <C-w>w " toggle between open windows
nmap <leader>zz :silent LazyGit

" new wave
nmap <leader>fv :Ex<cr>

" moving lines up and down
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" move line below up, and keep cursor stationary
nnoremap J mzJ`z

" keep cursor in middle while going up/down
" nnoremap <C-d> <C-d>zz
" nnoremap <C-u> <C-u>zz

" keep cursor in middle when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" will copy text into both copy buffer and system clipboard
nmap Y y$
nmap <leader>y :YRShow<cr>

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

" reselect pasted text
nnoremap gp `[v`]

" Clean opened buffers
command! Bd :up | %bd | e#

" Lsp specific keybinds
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> K <plug>(lsp-hover)
    " nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    " nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.lua,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Autocomplete
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

" highlight

" "---------------------
" " Plugin Keybinds
" "---------------------

" Plugins
call plug#begin()
Plug 'azabiong/vim-highlighter'
Plug 'amihere/smooth'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'ervandew/supertab'
Plug 'vim-scripts/YankRing.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-test/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
