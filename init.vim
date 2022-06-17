" init.vim for Neovim
" 2022/06/15
" hyperenju

" Plugin management
call plug#begin()
" neovim and vscode-neovim
Plug 'tpope/vim-surround'

if !exists('g:vscode')
    " neovim
    "" extension
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
    Plug 'ayu-theme/ayu-vim'
else
    " for vscode-neovim 
    Plug 'asvetliakov/vim-easymotion'
endif
call plug#end()

let g:clipboard = {
    \   'name': 'myClipboard',
    \   'copy': {
    \      '+': 'win32yank -i',
    \      '*': 'win32yank -i',
    \    },
    \   'paste': {
    \      '+': 'win32yank -o',
    \      '*': 'win32yank -o',
    \   },
    \   'cache_enabled': 1,
    \ }

" about clipbaord
set clipboard=unnamed

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
    colorscheme onedark
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
endif


" easymotion (deactivated until reading practical vim)
" map f <Plug>(easymotion-bd-w)
" nmap f <Plug>(easymotion-overwin-w)

let g:python3_host_prog = "/home/kohei/.config/nvim/.venv/bin/python"
