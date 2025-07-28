# aliases.zsh - custom aliases

# ls -> eza
if has_executable 'eza'; then
    alias ls='eza --group --group-directories-first --icons'
    alias ll='ls -l'
    alias la='ls -la'

    alias tree='eza -l --tree --icons'
else
    alias ll='ls -lh'
    alias la='ls -lah'
fi

# all-in nvim
if has_executable 'nvim'; then
    alias vim='nvim'
fi

# git
alias gcam='git commit --all --message'

# brew
if is_macos; then
    alias brewup='brew update && brew upgrade && brew cleanup'
fi

genpasswd() {
    # default length to 16 if no argument given
    local length=${1:-16}

    # use a portable locale, filter for A-Za-z0-9_, take $length chars, trim newline
    LC_ALL=C tr -dc 'A-Za-z0-9_' < /dev/urandom | head -c "$length" | xargs
}
