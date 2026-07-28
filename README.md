dotfiles
========


Installation:
-------------

    sudo apt-get install zsh git
    chsh -s /bin/zsh
    cd ~
    git clone http://github.com/ozen/dotfiles .dotfiles
    .dotfiles/setup

macOS settings:
---------------

Run the macOS settings script:

    .dotfiles/macos

This configures:

- Dock auto-hide animation duration to `0.15` seconds.
- Mouse acceleration (`com.apple.mouse.scaling`) to `-1`.
