# .zshenv (sourced always) - setup important environment variables

# put all zsh config into $ZDOTDIR
ZDOTDIR="$HOME/.config/zsh"

# $path/$PATH
# - make them unique
# - prepend $HOME/bin
typeset -U path PATH
path=($HOME/bin $HOME/.local/bin $path)
export PATH

# has_binary: util function to check if a binary exists in path
function has_binary () {
    command -v "$1" >/dev/null 2>&1
}

# $EDITOR/$VISUAL
if has_binary "nvim"; then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=vim
    export VISUAL=vim
fi


# is_macos: util function to special case macOS
function is_macos () {
    [[ "$(uname)" == "Darwin" ]]
}
