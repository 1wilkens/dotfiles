# keybinds.zsh - custom key bindings

## ctrl-r: regular history-search
bindkey '^r' history-incremental-search-backward

## up/down: history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
