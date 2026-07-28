dotfiles
========


Installation:
-------------

    sudo apt-get install zsh git
    chsh -s /bin/zsh
    cd ~
    git clone http://github.com/ozen/dotfiles .dotfiles
    .dotfiles/setup


VS Code settings recovery
-------------------------

The repository contains a curated backup of the user settings at
`vscode/settings.json`. It intentionally omits machine-specific paths,
temporary extension state, and project identifiers. The `setup` script does
not install or link this file.

If Settings Sync is unavailable or its cloud copy is lost, quit VS Code and
restore the settings manually on macOS:

    mkdir -p "$HOME/Library/Application Support/Code/User"
    cp "$HOME/.dotfiles/vscode/settings.json" \
        "$HOME/Library/Application Support/Code/User/settings.json"

The copy command replaces any existing user settings. Back up that file first
if it contains changes you want to keep. Restart VS Code after copying. The
referenced themes, formatters, and other extension-provided settings take
effect after their corresponding extensions are installed.
