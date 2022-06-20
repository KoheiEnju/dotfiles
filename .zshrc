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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:$HOME/windowsPath"

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
        g++ -std=c++17 $1 -o $basename
    else
        diff -q $1 $oldDir/$1 > /dev/null
        if [ $? -eq 1 ];then
            echo "Update detected.  Compiling..."
            rm -f $oldDir/$1
            cp $1 $oldDir/$1
            g++ -std=c++17 $1 -o $basename
        fi
    fi
    echo "Let's f**king go!"
    ./$basename
}

_crun(){
    _files
}

compdef _crun crun

start(){
    cmd /c start $1 > /dev/null
}

_start(){
    _files
}

compdef _start start



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
