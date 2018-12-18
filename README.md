
Checkout
========
	git clone --recursive https://github.com/jgagnon1/dotfiles.git ~/.dotfiles

NeoVIM setup
=========
	ln -s ~/.dotfiles/nvim ~/.config/nvim

VIM setup
=========
	ln -s ~/.dotfiles/.vim ~/.vim
	ln -s ~/.dotfiles/.vimrc ~/.vimrc
	vim +BundleInstall +qall

ZSH setup
=========
	ln -s ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/.dotfiles/.zshrc ~/.zshrc
	touch ~/.zshrc_local    (put your own configs in it, equivalent of .profile)

TMUX setup
==========
	Install GNU GREP: brew install https://raw.github.com/Homebrew/homebrew-dupes/master/grep.rb (see https://github.com/erikw/tmux-powerline)
	ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/.dotfiles/.tmux-powerline ~/.tmux-powerline
	ln -s ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc

Environment setup
=================
Either ln ~/.dotfiles/bin to ~/bin and then add ~/bin to your path (.zshrc_local) or
add ~/.dotfiles/bin to your path directly


