#!/usr/bin/env sh

# ┌──────────────────────────────────────────────────┐
# │                macOS preferences                 │
# └──────────────────────────────────────────────────┘

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