WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'

if [[ "$OSTYPE" == "darwin"* ]]; then
# MacVim
EDITOR='mvim -f'
VISUAL='mvim -f'
path+=/Applications/MacVim.app/Contents/bin
path+=/Library/Frameworks/Python.framework/Versions/3.8/bin
path+=/Users/cg433n/Library/Python/3.8/bin

# MacPorts
path=(/opt/local/bin $path)
path=(/opt/local/sbin $path)
fi
