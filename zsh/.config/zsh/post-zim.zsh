# this needs compdef defined
if has_executable "netbird"; then
    if ! (( $+functions[compdef] )); then
        autoload -Uz compinit && compinit
    fi
    eval "$(netbird completion zsh)"
fi

