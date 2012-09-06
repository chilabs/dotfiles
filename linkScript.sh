#BASH
rm ~/.profile
rm ~/.bashrc
rm ~/.bash_logout

ln -s ~/dotfiles/bash/.profile ~/.profile
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/bash/.logout ~/.bash_logout

#VIM
rm ~/.vimrc
rm ~/.vim
rm ~/.vim-fuf-data
rm ~/.vimfuzzyfinder

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/.vim ~/.vim
ln -s ~/dotfiles/vim/.vim-fuf-data ~/.vim-fuf-data
ln -s ~/dotfiles/vim/.vimfuzzyfinder ~/.vimfuzzyfinder

#GIT
rm ~/.gitconfig
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig

#Tmux
rm ~/.tmux.conf
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
