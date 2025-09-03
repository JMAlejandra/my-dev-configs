#!/bin/bash

# Install extensions
while read extension; do
    code --install-extension "$extension"
done < extensions.txt

# Copy settings based on OS
case "$(uname -s)" in
    Darwin*)    # macOS
        cp settings.json "$HOME/Library/Application Support/Code/User/"
        cp keybindings.json "$HOME/Library/Application Support/Code/User/"
        ;;
    Linux*)     # Linux
        cp settings.json "$HOME/.config/Code/User/"
        cp keybindings.json "$HOME/.config/Code/User/"
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)    # Windows
        cp settings.json "$APPDATA/Code/User/"
        cp keybindings.json "$APPDATA/Code/User/"
        ;;
esac
