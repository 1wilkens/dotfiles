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

# generate a secure random password from /dev/urandom
genpasswd() {
    # default length to 16 if no argument given
    local length=${1:-16}

    # use a portable locale, filter for A-Za-z0-9_, take $length chars, trim newline
    LC_ALL=C tr -dc 'A-Za-z0-9_' < /dev/urandom | head -c "$length" | xargs
}

# generate a resident FIDO2 (-sk) SSH key tagged ssh:<arg>, saved to ~/.ssh/id_yk_<arg>
yk-newkey() {
    emulate -L zsh
    local tag=$1
    if [[ -z $tag ]]; then
      print -u2 "usage: yk-newkey <tag>"
      return 1
    fi
    if [[ ! $tag =~ '^[A-Za-z0-9_-]+$' ]]; then
      print -u2 "yk-newkey: tag must be [A-Za-z0-9_-] (got: $tag)"
      return 1
    fi
    local out=$HOME/.ssh/id_yk_$tag
    if [[ -e $out ]]; then
      print -u2 "yk-newkey: $out already exists"
      return 1
    fi
    ssh-keygen -t ed25519-sk -O resident -O application=ssh:$tag -C "yk-$tag" -f $out
}

# record a terminal session with an optional tag
record() {
    local tag=${1:-default}
    if [[ ! $tag =~ '^[A-Za-z0-9_][A-Za-z0-9._-]*$' ]]; then
      print -u2 "record: invalid tag '$tag'"
      return 1
    fi

    local root
    if is_macos; then
      root=~/Documents/recordings
    else
      root=~/recordings
    fi

    local dir=$root/$tag
    mkdir -p "$dir" || return 1
    chmod 700 "$dir"
    script -q "$dir/session_$(date +%Y-%m-%d_%H-%M-%S).log"
}

_record() {
  local root
  if is_macos; then root=~/Documents/recordings; else root=~/recordings; fi
  _files -W "$root" -/
}

(( $+functions[compdef] )) && compdef _record record
