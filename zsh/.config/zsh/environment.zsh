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
fi

# macOS
if is_macos; then
    ## clipboard
    export CB_COPY_CMD="pbcopy"
    export CB_PASTE_CMD="pbpaste"

    ## homebrew: setup path and overall shell env
    if (( ${+commands[brew]} )); then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "Homebrew is missing. You may want to install it.."
    fi
fi
