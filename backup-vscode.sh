#!/bin/bash

# Create backup directory
BACKUP_DIR="vscode-backup"
mkdir -p "$BACKUP_DIR"

# Backup extensions
echo "📦 Backing up extensions..."
code --list-extensions > "$BACKUP_DIR/extensions.txt"

# Backup theme-related extensions
echo "🎨 Backing up themes..."
code --list-extensions | grep -i "theme" > "$BACKUP_DIR/themes.txt"

# Backup settings.json
echo "⚙️ Backing up settings..."
case "$(uname -s)" in
    Darwin*)    # macOS
        cp "$HOME/Library/Application Support/Code/User/settings.json" "$BACKUP_DIR/"
        cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$BACKUP_DIR/"
        ;;
    Linux*)     # Linux
        cp "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/"
        cp "$HOME/.config/Code/User/keybindings.json" "$BACKUP_DIR/"
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)    # Windows
        cp "$APPDATA/Code/User/settings.json" "$BACKUP_DIR/"
        cp "$APPDATA/Code/User/keybindings.json" "$BACKUP_DIR/"
        ;;
esac

# Create a restore script
cat > "$BACKUP_DIR/restore.sh" << 'EOF'
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
EOF

chmod +x "$BACKUP_DIR/restore.sh"

echo "✅ Backup complete! Your VS Code configuration has been saved to the '$BACKUP_DIR' directory"