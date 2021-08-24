WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
EDITOR='nova -w'

if [[ "$OSTYPE" == "darwin"* ]]; then
PATH="$HOME/.npm/bin:$PATH"
PATH="/opt/cisco/anyconnect/bin:$PATH"
PATH="/opt/homebrew/opt/node@14/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
fi
