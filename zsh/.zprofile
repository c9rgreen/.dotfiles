WORDCHARS='*?[]~&;!$%^<>'
GREP_OPTIONS='--color=auto'

if [[ "$OSTYPE" == "darwin"* ]]; then
EDITOR='gvim -f'
path+=/Applications/MacVim.app/Contents/bin
path+=/Library/Frameworks/Python.framework/Versions/3.8/bin
path+=~/Library/Python/3.8/bin
path+=~/.npm-global/bin
fi

##
# Your previous /Users/cg433n/.zprofile file was backed up as /Users/cg433n/.zprofile.macports-saved_2020-07-20_at_22:08:32
##

# MacPorts Installer addition on 2020-07-20_at_22:08:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

