# generic

# linux (aka non-macOS)
if ! is_macos; then
    ## clipboard
    export CB_COPY_CMD="wl-copy"
    export CB_COPY_CMD="wl-paste"

    ## gpg-agent: setup environment and update tty
    export SSH_AGENT_PID=""
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
    gpg-connect-agent updatestartuptty /bye >/dev/null

    ## java: fix certain java windows under tiling WMs
    export _JAVA_AWT_WM_NONREPARENTING=1
fi

# macOS
if is_macos; then
    ## clipboard
    export CB_COPY_CMD="pbcopy"
    export CB_COPY_CMD="pbpaste"

    ## homebrew: setup path and overall shell env
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
