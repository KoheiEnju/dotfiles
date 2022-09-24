if exists("g:vscode")
    source ~/.config/nvim/vscode.vim
else
    source ~/.config/nvim/neovim.vim
    if has("win64")
        set shell=pwsh
        set shellcmdflag=-c
        set shellquote= 
        set shellxquote=
    endif
endif
