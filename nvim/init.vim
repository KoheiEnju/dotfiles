if has("linux")
    if exists("g:vscode")
        source ~/.config/nvim/vscode.vim
    else 
        source ~/.config/nvim/neovim.vim
    endif
elseif has("win64")
    if exists("g:vscode")
        source ~/AppData/Local/nvim/vscode.vim
    else 
        source ~/AppData/Local/nvim/neovim.vim
    endif
    set shell=pwsh
    set shellcmdflag=-c
    set shellquote= 
    set shellxquote=
endif
