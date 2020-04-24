echo 'Starting script...'

#BASH
echo 'Linking bash dot files...'

rm -f ~/.profile
rm -f ~/.bashrc
rm -f ~/.bash_logout

ln -s ~/dotfiles/bash/profile ~/.profile
ln -s ~/dotfiles/bash/bashrc ~/.bashrc
ln -s ~/dotfiles/bash/logout ~/.bash_logout

source ~/.bashrc

#VIM
echo 'Linking vim dot files...'

rm -f ~/.vimrc
rm -rf ~/.vim/
rm -f ~/.vim-fuf-data
rm -f ~/.vimfuzzyfinder

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/vim ~/.vim
ln -s ~/dotfiles/vim/vim-fuf-data ~/.vim-fuf-data
ln -s ~/dotfiles/vim/vimfuzzyfinder ~/.vimfuzzyfinder

if [ ! -d ~/dotfiles/vim/vim/bundle/Vundle.vim/ ]; then
  cp -r ~/dotfiles/vim/Vundle.vim ~/dotfiles/vim/vim/bundle/Vundle.vim/
fi

#ACK
echo 'Linking ack dot files...'

rm -f ~/.ackrc
ln -s ~/dotfiles/ack/ackrc ~/.ackrc

#GIT
echo 'Linking git dot files...'

rm -f ~/.gitconfig
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig

#Tmux
echo 'Linking tmux dot files...'

rm -f ~/.tmux.conf
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

echo 'Success'
