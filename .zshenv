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

# Use the login keychain for the aws-vault
export AWS_VAULT_KEYCHAIN_NAME=login

# Set text editor to nova if inside Nova terminal
if [[ "$__CFBundleIdentifier" == "com.panic.Nova"* ]]; then
    export EDITOR='nova --wait'
fi

# Go
# Source: https://learning.oreilly.com/library/view/learning-go/9781492077206/ch01.html#workspace
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -f $HOME/.zshenv_private ]; then
    source $HOME/.zshenv_private
fi


# Paths

if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacPorts
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH

    # MacVim
    export PATH="/Applications/MacVim.app/Contents/bin:$PATH"

    # Cisco Anyconnect VPN path.
    export PATH="/opt/cisco/anyconnect/bin:$PATH"
    
    # Python pip3 install --user
    export PATH="$HOME/Library/Python/3.10/bin:$PATH"
fi

# Location for global node modules. Avoids having to install with sudo.
export PATH="$HOME/.local/npm/bin:$PATH"

# Binaries not managed with a package manager
export PATH="$HOME/.local/bin:$PATH"

