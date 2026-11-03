# load compdef if we don't have it yet
if ! (( $+functions[compdef] )); then
    autoload -Uz compinit && compinit
fi

# this needs compdef defined
if has_executable "netbird"; then
    eval "$(netbird completion zsh)"
fi

if has_executable "mutagen"; then
  _mutagen_project() {
    local action=$1 id=$2
    if [[ -z $id ]]; then
      print -u2 "usage: ${funcstack[2]} <ID>"
      return 2
    fi
    local file=~/.mutagen/projects/${id}.yml
    if [[ ! -f $file ]]; then
      print -u2 "error: project file not found: $file"
      return 1
    fi
    mutagen project "$action" -f "$file"
  }

  mup()   { _mutagen_project start "$1"; }
  mdown() { _mutagen_project terminate "$1"; }

  _mup_ids() { compadd -- ~/.mutagen/projects/*.yml(N:t:r); }
  compdef _mup_ids mup mdown
fi
