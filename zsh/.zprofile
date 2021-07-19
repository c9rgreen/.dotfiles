WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

if [[ "$OSTYPE" == "darwin"* ]]; then
EDITOR='nova -w'
PATH="$HOME/.npm/bin:$PATH"
PATH="$HOME/.bin:$PATH"
PATH="/opt/cisco/anyconnect/bin:$PATH"
PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
fi