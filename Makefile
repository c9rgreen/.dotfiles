.PHONY: install
install:
	# Ports
	sudo port install \
		universal-ctags \
		fossil \
		lilypond \
		zsh-autosuggestions \
		zsh-syntax-highlighting \
		wrangler \
		terraform-1.2 \
		packer \
		yt-dlp \
		tfsec \
		trivy \
		salt \
		entr \
		shfmt \
		sqlfluff \
		py39-black \
		py39-flake8 \
		nnn \
		tig \
		proselint \
		helm-3.10 \
		kubectl-1.25 \
		pandoc \
		stagit
	# Global node modules
	npm install --global \
		typescript-language-server \
		vscode-css-languageserver \
		jedi-language-server \
		yaml-language-server \
		prettier \
		surge \
		vls \
		vue-unused-components-checker \
		mermaid-cli \
		emmet


.PHONY: freeze
freeze:
	port -qv installed > ports.txt

.PHONY: link
link:
	stow \
	  ctags \
	  git \
	  nano \
	  npm \
	  pandoc \
	  tig \
	  tmux \
	  vim \
	  zsh

.PHONY: defaults
defaults:
	# Replace TextEdit as default text editor with BBEdit
	# https://apple.stackexchange.com/questions/123833/replace-text-edit-as-the-default-text-editor/123834#123834
	defaults write com.apple.LaunchServices/com.apple.launchservices.secure \
		LSHandlers -array-add \
		'{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.barebones.bbedit;}'
	defaults write com.apple.LaunchServices/com.apple.launchservices.secure \
		LSHandlers -array-add \
		'{LSHandlerContentType=public.unix-executable;LSHandlerRoleAll=com.barebones.bbedit;}'
	defaults write com.apple.LaunchServices/com.apple.launchservices.secure \
		LSHandlers -array-add \
		'{LSHandlerContentType=public.data;LSHandlerRoleAll=com.barebones.bbedit;}'
	# BBEdit expert preferences
	# Allow project drawer to receive keyboard focus
	defaults write com.barebones.bbedit ProjectsListCanAcquireKeyboardFocus -bool YES
