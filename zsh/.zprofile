WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

if [[ "$OSTYPE" == "darwin"* ]]; then
EDITOR='nova -w'
path+=/Applications/LilyPond.app/Contents/Resources/bin
path+=/Library/Frameworks/Python.framework/Versions/3.9/bin
path+=~/Library/Python/3.9/bin
path+=~/.npm-global/bin
path+=/opt/cisco/anyconnect/bin
fi
