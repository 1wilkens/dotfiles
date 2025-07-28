# generic

## atuin
if has_executable "atuin"; then
    eval "$(atuin init zsh --disable-up-arrow)"
else
    echo "atuin is not installed. You may want to install it.."
fi

# linux (aka non-macOS)
if ! is_macos; then
    ## clipboard
    if (( ${+WAYLAND_DISPLAY} )); then
        export CB_COPY_CMD="wl-copy"
        export CB_PASTE_CMD="wl-paste"
    elif (( ${+DISPLAY} )); then
        export CB_COPY_CMD="xclip"
        export CB_PASTE_CMD="xclip -o"
    fi

    ## gpg-agent: setup environment and update tty (only for non-root shells)
    if [ "$EUID" -ne 0 ] && has_executable "gpg-connect-agent"; then
        export SSH_AGENT_PID=""
        export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
        gpg-connect-agent updatestartuptty /bye >/dev/null
    fi

    ## java: fix certain java windows under tiling WMs
    export _JAVA_AWT_WM_NONREPARENTING=1

    ## nix toolchain (if installed)
    if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        source $HOME/.nix-profile/etc/profile.d/nix.sh
    fi
fi

# macOS
if is_macos; then
    ## clipboard
    export CB_COPY_CMD="pbcopy"
    export CB_PASTE_CMD="pbpaste"

    ## homebrew: setup shell env and adapt path
    if ! has_executable "brew"; then
        if [[ -d /opt/homebrew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"

            # prefer brew variants over builtin tools
            typeset -U path PATH
            if [[ -d $HOMEBREW_PREFIX/opt/curl ]]; then
                path=($HOMEBREW_PREFIX/opt/curl/bin $path)
            fi
            if [[ -d $HOMEBREW_PREFIX/opt/rustup ]]; then
                path=($HOMEBREW_PREFIX/opt/rustup/bin $path)
            fi
            export PATH
        else
            echo "brew is not installed. You may want to install it from https://brew.sh"
        fi
    fi

    ## homebrew: add completion files to fpath
    if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
        fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
    fi
fi
