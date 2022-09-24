" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'asvetliakov/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let mapleader = "\<Space>"
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

" clipboard
set clipboard=unnamed,unnamedplus

" shell
set shell=pwsh
set shellcmdflag=-c
set shellquote= 
set shellxquote=

