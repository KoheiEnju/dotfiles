call plug#begin()
" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Edit
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
" Movement
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'
" UI
Plug 'MunifTanjim/nui.nvim'
" Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
" Appearance
Plug 'rakr/vim-one'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
" Plug 'TaDaa/vimade'
" Font
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
" Window management
Plug 'simeji/winresizer'
" Terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
" Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind.nvim'
" Plug 'j-hui/fidget.nvim'
Plug 'kkharji/lspsaga.nvim'
" vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
" ENV
Plug 'jmcantrell/vim-virtualenv'
call plug#end()

