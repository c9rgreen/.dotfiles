.PHONY: install
install:
	$(info "Run with sudo")
	portindex ports
	./install --macports --npm --pip

.PHONY: link
link:
	./install --dotfiles

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

.PHONY: format
format:
	black install
	
.PHONY: uninstall
uninstall:
	$(info "Run with sudo")
	port -fp uninstall installed

.PHONY: web
web:
	$(info "Generating stacic website")
	cd web && stagit ..

.PHONY: serve
serve:
	$(info "Serving website")
	cd web && python3 -m http.server 8000

.PHONY: deploy
deploy:
	$(info "Deploy to Cloudflare")
	wrangler pages publish web
