# aliases.zsh - custom aliases

# ls -> eza
if has_binary "eza"; then
    alias ls='eza --group --group-directories-first'
fi
alias la='ls -lah'

# all-in nvim
if has_binary "nvim"; then
    alias vim='nvim'
fi

# git
alias gcam='git commit --all --message'

