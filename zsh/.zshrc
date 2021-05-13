autoload -U colors && colors

setopt multios
setopt prompt_subst

unsetopt flowcontrol

setopt auto_menu
setopt complete_in_word
setopt always_to_end

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt autocd

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

setopt menu_complete
setopt no_list_ambiguous
autoload -Uz compinit
compinit
zstyle ':completion:*' menu yes select

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

# Vim keybindings

function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

TRAPWINCH() {
  zle &&  zle -R
}

zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Window title
precmd () {
  print -Pn "\e]0; %n@%m: %~\a"
}

# Aliases
alias ls="ls -Gh"
alias ll="ls -alGh"
alias grep="grep --exclude-dir=node_modules"
