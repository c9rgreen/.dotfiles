# What goes where:
# 
#                                                  Set the environment for interactive shells.                     
#                            "For ksh fans."       Set $PATH here to get into the habit of making                  
#                                                  shell scripts portable.                                         
#                                   │                                     │                                        
#                                   └─────┐                 ┌─────────────┘                                        
#                                         │                 │                                                      
#                  ╔═════════╗      ┌───────────┐      ╔════════╗      ┌─────────┐      ┌────────┐                 
#                  ║ .zshenv ║─────▶│ .zprofile │─────▶║ .zshrc ║─────▶│ .zlogin │─────▶│.zlogout│                 
#                  ╚═════════╝      └───────────┘      ╚════════╝      └─────────┘      └────────┘                 
#                       │                 │                                 │                │                     
#                  ┌────┘                 └──────────────┬──────────────────┘                └─┐                   
#                  │                                     │                                     │                   
#                  │                                     │                                     │                   
# Set environmental variables here.  Set the environment for login shells.  Read when logging out of a session.    
#
# Source: https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# Source: https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where
# `export` makes the variable visible to programs run from zsh.

# Which characters should be considered as part of a word?
export WORDCHARS='*?[]~&;!$%^<>'

# Always use color when grepping.
export GREP_OPTIONS='--color=auto'

# Location of zsh history file. Redundant on macOS.
export HISTFILE="$HOME/.zsh_history"

# The maximum number of events stored in the internal history list. If
# you use the HIST_EXPIRE_DUPS_FIRST option, setting this value larger
# than the SAVEHIST size will give you the difference as a cushion for
# saving duplicated history events.
export HISTSIZE=10000000

# The maximum number of history events to save in the history file.
export SAVEHIST=10000000

# "darwin" is macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # BBEdit is a nice text editor. It has ctags and LSP support, for example.
  export EDITOR='bbedit --wait'
else
  # The dark side.
  export EDITOR='vim'
fi
