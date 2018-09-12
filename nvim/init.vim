" Vim Plug "
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Status line "
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" Color Schemes "
Plug 'morhetz/gruvbox'

" Text manipulation "
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Git "
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Dispatch "
Plug 'tpope/vim-dispatch'

" FZF "
Plug 'junegunn/fzf.vim'

" Language support"
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'

" Snippets "
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Linting "
Plug 'w0rp/ale'

" Autocomplete "
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'

" Goyo "
Plug 'junegunn/goyo.vim'

call plug#end()

filetype plugin indent on

" Tabs "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype rust setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype r setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype rmd setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype tex setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype tex setlocal spelllang=es_es spell

" Line numbering "
set number
set relativenumber

" Better Y "
nnoremap Y y$

" Better ESC "
inoremap jk <Esc>

" Window switching "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split settings "
set splitbelow
set splitright

" No swap files "
set noswapfile

" Theme "
syntax enable
if has("termguicolors")
	set termguicolors
endif

set background=dark
colorscheme gruvbox

" Lightline
set noshowmode
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:tmuxline_powerline_separators = 0

" Vim-Commentary "
autocmd Filetype c setlocal commentstring=//%s
autocmd Filetype cpp setlocal commentstring=//%s
autocmd Filetype cuda setlocal commentstring=//%s

" Git "
let g:gitgutter_enabled = 1

" FZF "
nnoremap <C-p> :Files<CR>

" Ultisnips "
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

" Dispatch "
autocmd FileType rust compiler cargo
autocmd FileType rust let b:dispatch = 'cargo run'

" Python
let g:python_host_prog = glob('~/.local/share/virtualenvs/neovim2*/bin/python')
let g:python3_host_prog = glob('~/.local/share/virtualenvs/neovim3*/bin/python')

" Rust
let g:rustfmt_autosave = 1

" Ale "
let g:ale_linters = {
\	'cpp': ['clang', 'gcc'],
\	'python': ['flake8'],
\	'rust': ['cargo'],
\}

let g:ale_cpp_clang_options = '-std=c++11 -Wall -Iinclude'
let g:ale_cpp_gcc_options = '-std=c++11 -Wall -Iinclude'

" Deoplete "
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
inoremap <expr><C-Space> deoplete#mappings#manual_complete()
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : ""
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : ""
inoremap <expr><C-h> deoplete#smart_close_popup()
autocmd CompleteDone * pclose

let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
let g:deoplete#sources#clang#flags = ['-Iinclude']

let g:deoplete#sources#rust#racer_binary='/home/mono/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/mono/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

" Allow local customizations in ~/.config/nvim/local.vim
let $LOCALFILE=expand("~/.config/nvim/local.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
