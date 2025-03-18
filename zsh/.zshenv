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

# annoyingly this has to be here to prevent the warning..
if ! is_macos; then
    # required on Ubuntu to prevent a warning of compinit being called twice
    OS_RELEASE="$(awk -F= '/^NAME/{print $2}' /etc/os-release)"
    [[ "${OS_RELEASE}" == '"Ubuntu"' ]] && skip_global_compinit=1
fi
