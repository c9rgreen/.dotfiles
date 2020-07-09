WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'

if [[ "$OSTYPE" == "darwin"* ]]; then
EDITOR='gvim -f'
path+=/Applications/MacVim.app/Contents/bin
path+=/Library/Frameworks/Python.framework/Versions/3.8/bin
path+=~/Library/Python/3.8/bin
path+=~/.npm-global/bin
fi
