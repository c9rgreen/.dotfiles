# ┌───────────────────────────────────────┐
# │                  Zsh                  │
# │          https://www.zsh.org          │
# └───────────────────────────────────────┘

# Credit: Many comments are copied verbatim from
# https://zsh.sourceforge.io/Doc/Release/Options.html.

# Enable colors.
autoload -U colors && colors

# Try to complete the word based on the position where the cursor is,
# rather than from the end of the word.
setopt COMPLETE_IN_WORD

# Move cursor to end of word after every completion, even if the cursor
# was in the middle of the word.
setopt ALWAYS_TO_END

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory
# stack.
setopt PUSHD_IGNORE_DUPS

# Change directories by typing the directory name alone without a "cd".
setopt AUTOCD

# Zsh sessions will append their history list to the history file,
# rather than replace it.
setopt APPEND_HISTORY

# Save each command’s beginning timestamp (in seconds since the epoch)
# and the duration (in seconds) to the history file
setopt EXTENDED_HISTORY

# If the internal history needs to be trimmed to add the current command
# line, setting this option will cause the oldest history event that has
# a duplicate to be lost before losing a unique event from the list.
setopt HIST_EXPIRE_DUPS_FIRST

# Do not enter command lines into the history list if they are
# duplicates of the previous event.
setopt HIST_IGNORE_DUPS

# Remove command lines from the history list when the first character on
# the line is a space, or when one of the expanded aliases contains a
# leading space.
setopt HIST_IGNORE_SPACE

# Whenever the user enters a line with history expansion, don’t execute
# the line directly; instead, perform history expansion and reload the
# line into the editing buffer.
setopt HIST_VERIFY

# This option both imports new commands from the history file, and also
# causes your typed commands to be appended to the history file (the
# latter is like specifying INC_APPEND_HISTORY, which should be turned
# off if this option is in effect).
setopt SHARE_HISTORY

# On an ambiguous completion, instead of listing possibilities or
# beeping, insert the first match immediately. Then when completion is
# requested again, remove the first match and insert the second match,
# etc. When there are no more matches, go back to the first one again.
setopt MENU_COMPLETE

# Display a dropdown-list style menu for completions.
zstyle ':completion:*' menu yes select

# vi keybindings

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

# Edit command in $EDITOR (emacs keybindings)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Plugins installed via Homebrew
#        ┌───────────┐       
#        │ Is macOS? │       
#        └───────────┘       
#              │             
#              ▼             
# ┌─────────────────────────┐
# │ Homebrew is installed?  │
# └─────────────────────────┘
#              │             
#              ▼             
#      ┌───────────────┐     
#      │ Load plugins  │     
#      └───────────────┘     
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
alias tree="tree --gitignore -I node_modules -I venv -C"
alias pip="pip3"
alias python="python3"
alias tig="tig --all"

# Functions
# Source https://stackoverflow.com/questions/3358420/generating-a-sha-256-hash-from-the-linux-command-line
sha256() { echo -n "$*" | shasum -a 256 }

# Paths
# macOS specific paths
if [[ "$OSTYPE" == "darwin"* ]]; then
	# Load Homebrew paths.
	eval "$(/opt/homebrew/bin/brew shellenv)"
		
	# Location for global node modules. Avoids having to install with sudo.
	export PATH="$HOME/.npm/bin:$PATH"
	
	# Cisco Anyconnect VPN path.
	export PATH="/opt/cisco/anyconnect/bin:$PATH"
	
	# Set the path for Homebrew node explicitly, as Node 14 is an old version.
	export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
fi
