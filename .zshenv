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

# Set text editor to Nova if inside Nova terminal
if [[ "$__CFBundleIdentifier" == "com.panic.Nova"* ]]; then
    export EDITOR='nova --wait'
fi
