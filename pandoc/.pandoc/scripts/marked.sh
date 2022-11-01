#!/usr/bin/env zsh

# Intended to be used by Marked 2 for building markdown previews.
# https://marked2app.com

PATH=/opt/homebrew/bin:$PATH

pandoc \
	--template=marked \
	$MARKED_PATH \
	| sed "s/&gt;/>/g" \
	| sed "s/&lt;/</g" \
	| sed "s/&quot;/\"/g" \
	| sed 's/&amp;/\&/g' \
	| sed 's/<pre class="mermaid"><code>/<pre><code class="mermaid">/g'
	
# The above sed invocations are intended to undo pandoc's character escapes
