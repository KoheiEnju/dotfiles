if status is-interactive
    # Commands to run in interactive sessions can go here
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:/usr/local/go/bin"
    export EDITOR="/usr/local/bin/nvim"
    export MANPAGER="/bin/sh -c \"col -b -x|nvim -R -c 'set ft=man nolist nonu noma' -\""

    alias ls="lsd"
    # la, ll is already defined in fish.
    # lt is a function with definition
    function lt --wraps=ls --description 'List contents of directory with tree option'
        ls --tree $argv
    end
    # lla is a function with definition
    function lla --wraps=ls --description 'List contents of directory with -la'
        ls -la $argv
    end

    # TODO: This shoud be activated only in WSL.
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

    # nvm
    set --universal nvm_default_version v18.12.0

    # python
    if [ -e $HOME/.py/bin/activate.fish ]
        source $HOME/.py/bin/activate.fish
    end

    # this line must be at end of the file
    starship init fish | source
end
