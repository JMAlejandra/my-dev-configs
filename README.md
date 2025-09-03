# my-dev-configs

Just a repo to save and share my configs for future use/setup restoration/reference 💅🏻

# Updates

| Date     | Description                        |
| -------- | ---------------------------------- |
| 09/03/25 | Uploaded list of vscode extensions |
|          |                                    |
|          |                                    |

---

# VS Code Configuration Manager 🛠️

A collection of scripts to backup, sync, and restore my VS Code extensions, themes, and preferences across multiple machines.

## 📋 Table of Contents

-   [Features](#features)
-   [Quick Start](#quick-start)
-   [Scripts Overview](#scripts-overview)
-   [Installation](#installation)
-   [Usage](#usage)
-   [File Structure](#file-structure)
-   [Supported Platforms](#supported-platforms)
-   [Contributing](#contributing)

## ✨ Features

-   📦 **Extensions Management**: Backup and restore all installed extensions
-   🎨 **Theme Configuration**: Save and sync your favorite themes
-   ⚙️ **Preferences Sync**: Backup indentation, formatting, and editor preferences
-   🔄 **Cross-Platform**: Works on Windows, macOS, and Linux
-   🚀 **Automated Setup**: One-command setup for new machines
-   📊 **Backup Verification**: Compare and verify installations

## 🚀 Quick Start

1. **Clone this repository:**
    ```bash
    git clone https://github.com/yourusername/vscode-config-manager.git
    cd vscode-config-manager
    ```
2. To backup your current VS Code setup, run the following commands:

```bash
chmod +x ./backup-vscode.sh

./backup-vscode.sh
```

3. To restore all settings on a new machine, run these commands:

```bash
cd vscode-backup

chmod +x ./restore.sh

./restore.sh
```

## 👩🏻‍💻 Other settings

In the `prettier` folder there's a `.prettierrc` file with my prefered formatting configurations. This is subject to change but for now it will do.

In the `ea-settings` folder there's both a `.prettierrc` file with the formatting configurations for my current project, and the workspace settings for the EA project.
