" Plugins
source ~/.config/nvim/neovim-plugin.vim

" ==========BINDINGS==========
let mapleader = "\<Space>"
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=45<CR>
nmap <buffer> <leader>ho <plug>(lsp-hover)
nmap <buffer> <leader>pdf <plug>(lsp-peek-definition)
nmap <buffer> <leader>gd <plug>(lsp-definition)
nmap <buffer> <F12> <plug>(lsp-definition)
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
colorscheme one
let g:lightline = {'colorscheme': 'one'}
set number relativenumber
set cursorline
hi CursorLineNr guibg=none guifg=Cyan
set showcmd
set hls
set laststatus=3
autocmd VimEnter * TSEnable highlight
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.enablesigns = 1
let g:vimade.enabletreesitter = 1

" ==========BEHAVIOR==========
set splitright
set splitbelow
set tabstop=4
set shiftwidth=4
set expandtab

" ==========FILER(Fern)==========
let g:fern_disable_startup_warnings = 1
tnoremap <Esc> <C-\><C-n>
set signcolumn=yes
let g:fern#default_hidden=1

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
