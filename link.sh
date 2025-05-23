#!/bin/sh

set -eu

SRC="$(dirname $0)"
DEST="$HOME"
_STOW="$(which stow) --dotfiles -d $SRC -t $DEST -vS"

echo "# Preparing folders and linking.."

if [[ "$*" == *"git"* ]]
then
    echo "--> git"
    $_STOW git
fi

if [[ "$*" == *"gpg"* ]]
then
    echo "--> gpg"
    mkdir -p ~/.gnupg
    $_STOW gpg
fi

if [[ "$*" == *"gtk"* ]]
then
    echo "--> gtk"
    mkdir -p ~/.themes
    mkdir -p ~/.config/{gtk-3.0,}
    $_STOW gtk
fi

if [[ "$*" == *"scripts"* ]]
then
    echo "--> scripts"
    mkdir -p ~/bin
    $_STOW scripts
fi

if [[ "$*" == *"sway"* ]]
then
    echo "--> sway"
    mkdir -p ~/.config/{gammastep,kanshi,mako,sway,waybar,systemd/user/sway-session.target.wants,}
    $_STOW sway
fi

if [[ "$*" == *"term"* ]]
then
    echo "--> term"
    mkdir -p ~/.config/{alacritty,bat,flavours}
    $_STOW term
fi

if [[ "$*" == *"vim"* ]]
then
    echo "--> vim"
    mkdir -p ~/.config/nvim/
    $_STOW vim
fi

if [[ "$*" == *"xdg"* ]]
then
    echo "--> xdg"
    mkdir -p ~/.config
    $_STOW xdg
fi

if [[ "$*" == *"zsh"* ]]
then
    echo "--> zsh"
    mkdir -p ~/.config/{zsh,zim/modules}
    $_STOW zsh
fi

echo "# All done!"
