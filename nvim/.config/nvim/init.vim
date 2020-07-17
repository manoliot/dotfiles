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
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Snippets "
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Goyo "
Plug 'junegunn/goyo.vim'

" coc "
" TODO ONLY LOADS WITH CERTAIN FILES
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on

" Tabs "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

autocmd Filetype asm setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype c setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype rust setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype tex setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype tex setlocal spelllang=es_es spell

autocmd Filetype r setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype rmd setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sts=2 sw=2 expandtab

" Templates "
autocmd BufNewFile *.tex -r ~/.config/nvim/templates/tex.skeleton

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

" coc "
let g:coc_global_extensions = [
    \ "coc-texlab",
    \ "coc-clangd",
    \ "coc-rls",
    \ "coc-python",
    \ "coc-vetur"
\ ]

set hidden
inoremap <expr><C-Space> coc#refresh()
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr><C-h> pumvisible() ? "\<C-e>" : "\<C-h>"
autocmd CompleteDone * pclose

let mapleader=" "

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Allow local customizations in ~/.config/nvim/local.vim
let $LOCALFILE=expand("~/.config/nvim/local.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
