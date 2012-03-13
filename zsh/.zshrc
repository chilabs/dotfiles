# ~/.zshrc: executed by zsh(1) for non-login shells.

# Configuration Settings
#if [ -f ~/dotfiles/bash/.config ]; then 
#    . ~/dotfiles/bash/.config
#fi

# Environment Variables
#if [ -f ~/dotfiles/bash/.env ]; then 
#    . ~/dotfiles/bash/.env
#fi

# Aliases
#if [ -f ~/dotfiles/bash/.aliases ]; then 
#    . ~/dotfiles/bash/.aliases
#fi

autoload -U compinit promptinit
compinit
promptinit

prompt walters

setopt completealiases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
