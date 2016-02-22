all:
	ln -s ~/.oh-my-zsh/.zshrc ~/.zshrc
	ln -s ~/.oh-my-zsh/.tmux.conf ~/.tmux.conf
	mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
	ln -s ~/.vim $XDG_CONFIG_HOME/nvim
	ln -s ~/.spf13-vim-3/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
	ln -s ~/.spf13-vim-3/.vimrc.local ~/.vimrc.local
	ln -s ~/.spf13-vim-3/.vimrc.before ~/.vimrc.before
	ln -s ~/.spf13-vim-3/.vimrc.before.local ~/.vimrc.before.local
	ln -s ~/.spf13-vim-3/.vimrc.bundles ~/.vimrc.bundles
	ln -s ~/.spf13-vim-3/.vimrc.bundles.local ~/.vimrc.bundles.local
