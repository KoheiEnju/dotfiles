if has("linux")
    if exists("g:vscode")
        source ~/.config/nvim/vscode.vim
    else 
        source ~/.config/nvim/neovim.vim
    endif
elseif has("win64")
    if exists("g:vscode")
        source ~/AppData/nvim/vscode.vim
    else 
        source ~/AppData/nvim/neovim.vim
    endif
    set shell=pwsh
    set shellcmdflag=-c
    set shellquote= 
    set shellxquote=
endif
