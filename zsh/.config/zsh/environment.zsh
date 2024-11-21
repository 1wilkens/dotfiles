# gpg-agent: setup environment and update tty
if ! is_macos; then
    export SSH_AGENT_PID=""
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
    gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# java: fix certain java windows under tiling WMs
if ! is_macos; then
    export _JAVA_AWT_WM_NONREPARENTING=1
fi

# macOS: setup homebrew
if is_macos; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
