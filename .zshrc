# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH="$PATH:$HOME/windowsPath"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/go/bin"

# g++ alias
function crun() {
    oldDir=".old"
    basename=$(basename $1 .cpp)
    if [ ! -e .old ]; then
        echo "Making .old directory..."
        mkdir $oldDir
    fi
    if [ ! -e .old/$1 ];then
        echo "Compiling new file..."
        cp $1 $oldDir/$1
        g++ -std=c++17 $1 -o $oldDir/$basename
    else
        diff -q $1 $oldDir/$1 > /dev/null
        if [ $? -eq 1 ];then
            echo "Update detected.  Compiling..."
            rm -f $oldDir/$1
            cp $1 $oldDir/$1
            g++ -std=c++17 $1 -o $oldDir/$basename
        fi
    fi
    echo "Let's f**king go!"
    ./$oldDir/$basename
}

_crun(){
    _files -g "*.cpp"
}

compdef _crun crun

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# win32yank alias
function clip(){
    cat $1 | xsel -ib
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# default editor
export EDITOR="/usr/local/bin/vim"

export MANPAGER="/bin/sh -c \"col -b -x|nvim -R -c 'set ft=man nolist nonu noma' -\""

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/usr/local/go/bin"
# export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
export PATH="$PATH:/usr/local/cuda/bin"
export PATH="$PATH:/opt/nvidia/hpc_sdk/Linux_x86_64/22.7/compilers/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/wsl/lib"

export PYTHONPATH="$PYTHONPATH:$HOME/repos/acanthus"
export PATH="$PATH:$HOME/.local/bin"

export PYTHONPATH="$PYTHONPATH:$HOME/repos/acanthus"
export PATH="$PATH:$HOME/.local/bin"

export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"

export PATH="$PATH:$HOME/local/bin"
export PYTHONPATH="$PYTHONPATH:$HOME/software/acanthus"

pyrun (){
    srun -p $1 singularity run --env PYTHONPATH="$PYTHONPATH" --nv /home/singularity/acanthus-dev.sif python3 $2
}
eval "$(zoxide init zsh)"
