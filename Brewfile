# -*- mode: ruby -*-
# vi: set ft=ruby :

# ┌──────────────────────────────────────────────────┐
# │                     Brewfile                     │
# │  https://docs.brew.sh/Manpage#bundle-subcommand  │
# └──────────────────────────────────────────────────┘

# As a general rule, I prefer to install global or system-wide utilities
# via the system's package manager, rather than that of the language.
# For example, cookiecutter is a Python module which I would rather
# install with brew or apt than with pip.

# ┌────────┐
# │  Taps  │
# └────────┘

tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/cask-fonts"
tap "saguarospace/saguarospace"
tap "mczachurski/wallpapper"
tap "hashicorp/tap"
tap "superfly/tap"

# ┌─────────────┐
# │  Languages  │
# └─────────────┘

brew "node@14"
brew "python@3.10"
brew "ruby"
brew "go"

# ┌─────────────┐
# │  Utilities  │
# └─────────────┘

# Password manager
brew "pass"

# Symlink manager - used for managing dotfiles
# https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
brew "stow"

# For working with JSON
brew "jq"

# Run commands when files change
brew "entr"

# Convert video formats
brew "ffmpeg"

# Convert image formats
brew "imagemagick"

# Convert bitmap images to SVGs
# https://christophergreen.tech/2021-11-27-creating-vectors-with-potrace.html
brew "potrace"

# Pandoc
# I wrote nearly every paper in college with this
brew "pandoc"

# Jump-to-symbol functionality for Vim and BBEdit, among others
# http://vimdoc.sourceforge.net/htmldoc/tagsrch.html
# https://www.bbeditextras.org/advanced-ctags-hacking/
brew "universal-ctags"

# Interesting SCM tool
brew "fossil"

# I can't remember why I needed SVN
brew "svn"

# Network testing and troubleshooting
brew "nmap"

# scipy from Homebrew comes with a wheel that works on Apple Silicon
brew "scipy"

# Weird Python package manager.
brew "poetry"

# Scaffolding for Python
brew "cookiecutter"

# Literate programming tool for Python
brew "jupyterlab"

# SQLite viewer for Python
brew "datasette"

# SQL formatter
brew "sqlfluff"

# Graph diagram generator
brew "graphviz"

# Music typsetter
# https://christophergreen.tech/2021-12-03-running-lilypond-on-macos.html
brew "lilypond"

# Python formatter
brew "black"

# Python linter
brew "flake8"

# Yaml linter
brew "yamllint"

# Writing linter
# http://proselint.com
brew "proselint"

# Cattle, not pets
brew "ansible"

# JavaScript, HTML, CSS formatter
brew "prettier"

# Shell script formatter
brew "shfmt"

# Markdown-like syntax for graphs, diagrams, and charts
brew "mermaid-cli"

# Postgres database
brew "postgresql"

# Curses-style CLI for Postgres
brew "pgcli"

# Website log explorer and analytics generator
# https://goaccess.io
brew "goaccess"

# Terminal-emulator-agnostic way to achieve multiple panes and split windows
brew "tmux"

# File browser
brew "nnn"

# Curses-style Git client
brew "tig"

# View image exif data
brew "exiftool"

# Interesting shell
# https://www.nushell.sh
brew "nushell"

# ┌───────────┐
# │  Z-Shell  │
# └───────────┘

# Suggest commands/completions based on history & other things
brew "zsh-autosuggestions"

# Search history with up/down arrows
brew "zsh-history-substring-search"

# Completions for many CLI utilities
brew "zsh-completions"

# Syntax highlighting in the prompt
brew "zsh-syntax-highlighting"

# ┌─────────┐
# │  Cloud  │
# └─────────┘

# AWS
brew "awscli"

# Cloudflare
brew "cloudflare-wrangler"

# GitHub (official)
# Difference between hub and gh: https://github.com/cli/cli/issues/312
brew "gh"

# GitLab (unofficial)
# https://glab.readthedocs.io/en/latest/
brew "glab"

# Rancher
brew "rancher-cli"

# ┌──────────────────┐
# │   Applications   │
# └──────────────────┘

# Favorite text editor
cask "bbedit"

# ASCII art drawing + diagrams
cask "monodraw"

# Obligatory Chrome browser for websites which don't work well with Safari
cask "microsoft-edge"

# My brain
cask "devonthink"

# Diagrams
cask "omnigraffle"

# Adobe Photoshop, InDesign, and Illustrator replacements
cask "affinity-photo"
cask "affinity-designer"
cask "affinity-publisher"

# LaTeX
cask "mactex-no-gui"

# Peer-to-peer file syncing
cask "syncthing"

# Virtual Machines
# The VMWare provider for Vagrant is officially supported by Hashicorp
cask "vmware-fusion-tech-preview"

# ┌──────────────────────────────────────────────────┐
# │                      Fonts                       │
# │ https://github.com/Homebrew/homebrew-cask-fonts  │
# └──────────────────────────────────────────────────┘

cask "font-recursive"
cask "font-recursive-code"
cask "font-goudy-bookletter-1911"
cask "font-junction"
cask "font-league-spartan"
cask "font-orbitron"
cask "font-ostrich-sans"
cask "font-pt-sans"
cask "font-pt-serif"
cask "font-pt-mono"
cask "font-terminus"
cask "font-iosevka"

# ┌────────────────────────────────────────────────────────┐
# │                     Saguaro Space                      │
# │ https://github.com/saguarospace/homebrew-saguarospace  │
# └────────────────────────────────────────────────────────┘

# Language servers
brew "typescript-language-server"
brew "vls"
brew "vscode-css-languageserver"
brew "jedi-language-server"
brew "yaml-language-server"

# Personal BBEdit utility scripts
brew "saguarospace-bbedit-utils"

# ┌────────────────┐
# │   Hashicorp    │
# └────────────────┘

cask "vagrant"
cask "vagrant-vmware-utility"
brew "terraform"
brew "terraform-ls"
brew "packer"

# ┌───────────┐
# │  Fly.io   │
# └───────────┘

brew "flyctl"

# ┌───────────────┐
# │   Wallpaper   │
# └───────────────┘

brew "wallpapper"