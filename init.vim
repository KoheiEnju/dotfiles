" init.vim for Neovim
" 2022/06/15
" hyperenju

" Plugin management
call plug#begin()
" neovim and vscode-neovim
Plug 'tpope/vim-surround'

if !exists('g:vscode')
    " neovim
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-repeat'
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'lambdalisue/fern.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    "" appearance
    Plug 'dracula/vim'
    Plug 'rakr/vim-one'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'
    Plug 'tomasr/molokai'
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'sonph/onehalf', {'rtp': 'vim'}
    Plug 'markvincze/panda-vim'
    Plug 'ayu-theme/ayu-vim'
else
    " for vscode-neovim 
    Plug 'asvetliakov/vim-easymotion'
endif
call plug#end()

" about clipbaord
set clipboard=unnamed,unnamedplus

if has("win64") || has("win32")
    " shell
    set shell=pwsh
    set shellcmdflag=-c
    set shellquote= 
    set shellxquote=
endif

if has("linux")
endif

if !exists('g:vscode')
    filetype plugin indent on
    syntax enable
    set termguicolors
    colorscheme molokai
    set number
    set showcmd
    set hls
    set splitright
    nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=45<CR>
    let g:lightline = {'colorscheme': 'one'}
    set tabstop=4
    set shiftwidth=4
    set expandtab
    let g:gitgutter_async=0
    set updatetime=100
    highlight Normal ctermbg=NONE guibg=NONE
    highlight LineNr ctermbg=NONE guibg=NONE
    highlight NonText ctermbg=NONE guibg=NONE
    highlight Folded ctermbg=NONE guibg=NONE
    highlight EndOfBuffer ctermbg=NONE guibg=NONE
    set mouse=
    autocmd VimEnter * TSEnable highlight
    let mapleader = "\<Space>"
    nmap <buffer> <leader>ho <plug>(lsp-hover)
    nmap <buffer> <leader>pdf <plug>(lsp-peek-definition)
    nmap <buffer> <leader>gd <plug>(lsp-definition)
    nmap <buffer> <leader>rg :Rg <CR>
endif


" easymotion (deactivated until reading practical vim)
map <C-f> <Plug>(easymotion-bd-w)
nmap <C-f> <Plug>(easymotion-overwin-w)

let g:python3_host_prog = "/home/kohei/.config/nvim/.venv/bin/python"
let g:fern_disable_startup_warnings = 1
tnoremap <Esc> <C-\><C-n>
set signcolumn=no
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
