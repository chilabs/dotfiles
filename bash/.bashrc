# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Configuration Settings
if [ -f ~/dotfiles/bash/.config ]; then 
    . ~/dotfiles/bash/.config
fi

# Environment Variables
if [ -f ~/dotfiles/bash/.env ]; then 
    . ~/dotfiles/bash/.env
fi

# Aliases
if [ -f ~/dotfiles/bash/.aliases ]; then 
    . ~/dotfiles/bash/.aliases
fi
