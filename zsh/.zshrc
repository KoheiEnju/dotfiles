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
export PATH="$PATH:$HOME/workdir/nvim-linux64/bin"

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

export MANPAGER='nvim +Man!'

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

export PATH="$PATH:$HOME/local/bin"
export PYTHONPATH="$PYTHONPATH:$HOME/software/acanthus"

pyrun (){
    srun -p $1 singularity run --env PYTHONPATH="$PYTHONPATH" --nv /home/singularity/acanthus-dev.sif python3 $2
}
eval "$(zoxide init zsh)"

export PATH="$PATH:$HOME/repos/alacritty/target/release"
alias nnn="nnn -c"

export TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'

alias ls="lsd"
alias lla="ls -la"
alias lt="ls --tree"

eval "$(starship init zsh)"

# Kernel Development
# ref: https://kuniyu.jp/ja/blog/2/

GHQ_ROOT="$HOME/ghq"
LINUX_REPO="$GHQ_ROOT/git.kernel.org/pub/scm/linux/kernel/git/stable/linux"
alias myqemu_vanilla="qemu-system-x86_64 -boot c -m 2048M -kernel /home/fedora/ghq/github.com/torvalds/linux/arch/x86/boot/bzImage -hda $GHQ_ROOT/gitlab.com/buildroot.org/buildroot/output/images/rootfs.ext4 -append 'root=/dev/sda rw console=ttyS0,115200 acpi=off nokaslr' -serial stdio -display none -nic user,hostfwd=tcp::10022-:22"
alias myqemu_fedora="qemu-system-x86_64 -boot c -m 2048M -kernel /boot/vmlinuz-6.6.9-200.fc39.x86_64 -hda $GHQ_ROOT/gitlab.com/buildroot.org/buildroot/output/images/rootfs.ext4 -append 'root=/dev/sda rw console=ttyS0,115200 acpi=off nokaslr' -serial stdio -display none -nic user,hostfwd=tcp::10022-:22"

# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

function globalx () {
    global -x $1 | fzf --reverse | awk '{system("nvim +" $2 " " $3)}'
}

function globalrx () {
    global -rx $1 | fzf --reverse | awk '{system("nvim +" $2 " " $3)}'
}

function whichrpm (){
    rpm -qf $(which $1)
}

function _globalx () {
    global -x $1 | fzf --reverse | awk '{print("+" $2 " " $3)}'
}

function chgrep(){
    grep --include '*.c' --include '*.h' $@
}
