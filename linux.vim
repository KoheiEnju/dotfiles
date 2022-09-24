" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'simeji/winresizer'
Plug 'TaDaa/vimade'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'jmcantrell/vim-virtualenv'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
call plug#end()

" ==========BINDINGS==========
let mapleader = "\<Space>"
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=45<CR>
nmap <buffer> <leader>ho <plug>(lsp-hover)
nmap <buffer> <leader>pdf <plug>(lsp-peek-definition)
nmap <buffer> <leader>gd <plug>(lsp-definition)
nmap <buffer> <leader>rg :Rg <CR>
"" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ==========CLIPBOARD==========
set clipboard=unnamed,unnamedplus

" ==========MOUSE==========
set mouse=

" ==========APPEARANCE==========
syntax enable
set termguicolors
set number
set showcmd
set hls
colorscheme one
let g:lightline = {'colorscheme': 'one'}
autocmd VimEnter * TSEnable highlight
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.enablesigns = 1
let g:vimade.enabletreesitter = 1

" ==========BEHAVIOR==========
set splitright
set tabstop=4
set shiftwidth=4
set expandtab

" ==========FILER(Fern)==========
let g:fern_disable_startup_warnings = 1
tnoremap <Esc> <C-\><C-n>
set signcolumn=no

