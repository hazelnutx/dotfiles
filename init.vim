syntax on
set encoding=UTF-8

" Custom vimrc per projects
set exrc

" Insert mode bold cursor
set guicursor=

set guifont=FiraCode
set cursorline
set hidden
set nohlsearch
set tabstop=4 softtabstop=4
set smartindent
set shiftwidth=4
set expandtab
set background=dark
set autoread
" Undo
set nobackup
set undodir=~/.vim/undodir
set undofile
"set nowritebackup
set noswapfile

set colorcolumn=80
set signcolumn=yes
set incsearch
set relativenumber
set nu rnu
set foldlevelstart=99

syntax enable
set scrolloff=8

set nocompatible

"minimum deoplete settings:
let g:deoplete#enable_at_startup = 1
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


set completeopt=longest,menuone,preview
"Deprecated need to move onto deoplete#custom#option
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file']

"call deoplete#custom#option('sources', {  'css': ['buffer', 'lsp'], 'html': ['buffer', 'file', 'lsp'], 'javascript': ['buffer', 'lsp'], 'javascript.jsx': ['buffer', 'lsp'], 'scala': ['buffer', 'lsp'], 'typescript': ['buffer', 'lsp'], 'typescript.tsx': ['buffer', 'lsp'], 'rust': ['buffer', 'lsp'], 'python': ['buffer', 'lsp']})
set completeopt-=preview

call plug#begin('~/.config/nvim/autoload/')
Plug 'ianks/vim-tsx'
"Plug 'maxmellon/vim-jsx-pretty'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Dont use it
"Colorscheme
Plug 'ntk148v/vim-horizon'

Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'joshdick/onedark.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sheerun/vim-polyglot'
" Git
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'ryanoasis/vim-devicons'
" Prettier 
"Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript','css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
"let g:prettier#autoformat_require_pragma = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync"Comment Plugin
Plug 'preservim/nerdcommenter'

"Autocomplete
Plug 'zchee/deoplete-jedi'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else 
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

"Auto-format plugin
Plug 'sbdchd/neoformat'

"Code Jump Plugin
Plug 'davidhalter/jedi-vim'

"Code checker
"Plug 'dense-analysis/ale'
Plug 'neomake/neomake'

"Code folding
Plug 'tmhedberg/SimpylFold'

"ripgrep
"Plug 'jremmen/vim-ripgrep'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'pappasam/coc-jedi', { 'do': 'npm install --frozen-lockfile && npm build' }
call plug#end()
let g:SimpylFold_docstring_preview = 0


" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact


" vim ariline theme
let g:airline#extensions#tabline#enabled = 1
" Transparent bg?
highlight Normal guibg=none


"Jedi Vim
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0 
let g:deoplete#sources#jedi#show_docstring = 1
let g:jedi#use_splits_not_buffers = "right"

"Definitions
"<leader>d: go to definition
"K check documentation of class or method
"<leader>n: show the usage of a name in current file
"<leader>r: rename a name

"Code checker
call neomake#configure#automake('nrwi', 500)

set shortmess+=c
inoremap <c-c> <ESC>

colorscheme onedark

let mapleader = " "
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ne :NERDTreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <C-S> :w<CR>
tnoremap <ESC> <C-\><C-N>
inoremap <C-S> <ESC>:write<CR>
inoremap <silent><expr> <C+k> coc#refresh()
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>p :Rg<CR>

autocmd StdinReadPre * let s:std
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | :vertical resize 60 | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"toggle Tagbag
map <Leader>t :TagbarToggle<CR>

"Allow NERDTree to show hidden files"
let NERDTreeShowHidden=1

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
let g:python3_host_prog='/usr/local/Cellar/python@3.9/3.9.2_2/bin/python3'

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }


let g:airline_powerline_fonts = 1

" Focus and redistribute split windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

" Tabs and Buffers
let g:airline#extensions#tabline#fnamemode=':t'
let g:airline#extensions#tabline#enabled=1 
nnoremap <Leader>q :bp<CR>
nnoremap <Leader>e :bn<CR>
nnoremap <Leader>w :bd<CR>

" Use CTRL+c to copy to system clipboard
noremap <C-c> "+y
"inoremap <Tab> <C-c><Esc>

:cmap WQ wq

" Vertical split
nnoremap <Leader>v :vsplit<CR>
" Horizontal split
nnoremap <Leader>sh :split<CR>

" Coc Installs
" coc-tsserver
" coc-html coc-css coc-vetur coc-prettier coc-json









