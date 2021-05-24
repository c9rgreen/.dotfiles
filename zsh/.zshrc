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
alias grep="grep --exclude-dir=node_modules --exclude-dir=venv"

# Environmental variables
WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
EDITOR='vim'

if [[ "$OSTYPE" == "darwin"* ]]; then
EDITOR='mvim -f'
PATH="/Applications/MacVim.app/Contents/bin:$PATH"
PATH="/Applications/LilyPond.app/Contents/Resources/bin:$PATH"
PATH="/opt/npm/bin:$PATH"
PATH="/opt/cisco/anyconnect/bin:$PATH"
PATH="/$HOME/Library/Python/3.9/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/sbin:$PATH"
fi

# Plugins
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "$HOME/.zsh/zsh-completions/zsh-completions.plugin.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
