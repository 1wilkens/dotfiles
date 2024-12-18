# aliases.zsh - custom aliases

# ls -> eza
if has_binary 'eza'; then
    alias ls='eza --group --group-directories-first --icons'
    alias ll='ls -l'
    alias la='ls -la'

    alias tree='eza -l --tree --icons'
else
    alias ll='ls -lh'
    alias la='ls -lah'
fi

# all-in nvim
if has_binary 'nvim'; then
    alias vim='nvim'
fi

# git
alias gcam='git commit --all --message'

# brew
if is_macos; then
    alias brewup='brew update && brew upgrade && brew cleanup'
fi
