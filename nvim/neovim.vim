" Plugins
source ~/.config/nvim/neovim-plugin.vim

" ==========BINDINGS==========
let mapleader = "\<Space>"
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=45<CR>
nmap <buffer> <leader>rg :Rg <CR>
"" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" type jj to exit insert mode
inoremap <silent> jj <Esc>
" no-hihghlight
nmap <Leader>noh :noh <CR>

" ==========CLIPBOARD==========
set clipboard=unnamed,unnamedplus

" ==========MOUSE==========
set mouse=

" ==========APPEARANCE==========
syntax enable
set termguicolors
colorscheme nightfox
set number relativenumber
set cursorline
hi CursorLineNr guibg=none guifg=Cyan
set showcmd
set hls
set laststatus=3
set title
autocmd VimEnter * TSEnable highlight
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.enablesigns = 1
let g:vimade.enabletreesitter = 1
lua << EOF
    require("noice").setup()
EOF

" ==========BEHAVIOR==========
set splitright
set splitbelow
set softtabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set infercase
set noswapfile
set nobackup
set nowritebackup

" LSP
lua << EOF
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end }) require("mason").setup()

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" ==========FILER(Fern)==========
let g:fern_disable_startup_warnings = 1
tnoremap <Esc> <C-\><C-n>
set signcolumn=yes
let g:fern#default_hidden=1
let g:fern#renderer = "nerdfont"
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" DEBUG
lua << EOF
  require'dapui'.setup()
  require'dap-go'.setup()
  require'dap'.listeners.before['event_initialized']['custom'] = function(session, body)
    require'dapui'.open()
  end
  require'dap'.listeners.before['event_terminated']['custom'] = function(session, body)
    require'dapui'.close()
end
  Dap = {}
  Dap.vim_test_strategy = {
    go = function(cmd)
      local test_func = string.match(cmd, "-run '([^ ]+)'")
      local path = string.match(cmd, "[^ ]+$")
      path = string.gsub(path, "/%.%.%.", "")
      configuration = {
        type = "go",
        name = "nvim-dap strategy",
        request = "launch",
        mode = "test",
        program = path,
        args = {},
      }
      if test_func then
        table.insert(configuration.args, "-test.run")
        table.insert(configuration.args, test_func)
      end

      if path == nil or path == "." then
        configuration.program = "./"
      end
      return configuration
    end,
  }
  function Dap.strategy()
    local cmd = vim.g.vim_test_last_command
    local filetype = vim.bo.filetype
    local f = Dap.vim_test_strategy[filetype]

    if not f then
      print("This filetype is not supported.")
      return
    end

    configuration = f(cmd)
    require'dap'.run(configuration)
  end
EOF

" python
if has("linux")
    let g:python3_host_prog = "/usr/bin/python3"
endif
" pylsp
autocmd BufWritePre *.py LspDocumentFormatSync
let g:lsp_settings = {
            \  'pylsp-all': {
            \    'workspace_config': {
            \      'pylsp': {
            \        'configurationSources': ['flake8'],
            \        }
            \      }
            \    }
            \  }
