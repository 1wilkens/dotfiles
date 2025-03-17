# generic

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
    if [ "$EUID" -ne 0 ]; then
        export SSH_AGENT_PID=""
        export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
        gpg-connect-agent updatestartuptty /bye >/dev/null
    fi

    ## java: fix certain java windows under tiling WMs
    export _JAVA_AWT_WM_NONREPARENTING=1

    # required on Ubuntu to prevent a warning of compinit being called twice
    OS_RELEASE="$(awk -F= '/^NAME/{print $2}' /etc/os-release)"
    [[ "${OS_RELEASE}" == '"Ubuntu"' ]] && skip_global_compinit=1
fi

# macOS
if is_macos; then
    ## clipboard
    export CB_COPY_CMD="pbcopy"
    export CB_PASTE_CMD="pbpaste"

    ## homebrew: setup shell env and adapt path
    if ! (( ${+commands[brew]} )); then
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

fi
