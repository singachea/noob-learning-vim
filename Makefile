


default:
	git submodule init
	git submodule update


update-local:
	cp .vimrc ~/.vimrc


update-remote:
	cp ~/.vimrc .vimrc
