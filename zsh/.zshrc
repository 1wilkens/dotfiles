# .zshrc

## prepare zsh/zim environment
ZDOTDIR="$HOME/.config/zsh"
ZIM_HOME="$HOME/.config/zim"

## zim: configure modules through zstyle
### git: small g as prefix
zstyle ':zim:git' aliases-prefix 'g'

## zim: install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

## zim: initialize modules.
source ${ZIM_HOME}/init.zsh

# base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_atelier-dune
