# .zshenv (sourced always) - setup important environment variables

# put all zsh config into $ZDOTDIR
ZDOTDIR="$HOME/.config/zsh"

# $path/$PATH
# - make them unique
# - prepend $HOME/bin
typeset -U path PATH
path=($HOME/bin $HOME/.local/bin $path)
export PATH

# $EDITOR/$VISUAL
export EDITOR=nvim
export VISUAL=nvim
