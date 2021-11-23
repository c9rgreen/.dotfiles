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
zstyle ':completion:*' menu yes select

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

# Vim keybindings

# function zle-keymap-select() {
#   zle reset-prompt
#   zle -R
# }
# 
# TRAPWINCH() {
#   zle &&  zle -R
# }
# 
# zle -N zle-keymap-select
# zle -N edit-command-line
# 
# bindkey -v
# autoload -Uz edit-command-line
# bindkey -M vicmd 'v' edit-command-line

# Edit command in external editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line


# Window title
precmd () {
  print -Pn "\e]0; %n@%m: %~\a"
}

# Plugins
if [[ "$OSTYPE" == "darwin"* ]]; then
  if type brew &>/dev/null; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    
    autoload -Uz compinit
    compinit
  fi
fi

# Aliases
alias ls="ls -Gh"
alias ll="ls -alGh"
alias nano="nano -m"
alias grep="grep --exclude-dir=node_modules --exclude-dir=venv"
alias pip="pip3"
alias python="python3"
