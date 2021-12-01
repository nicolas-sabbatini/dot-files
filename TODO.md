install nvim
install xclip

change bashrc and bash_alias
	rm ~/.bashrc
	ln -s ~/.config/dot-files/bashrc ~/.bashrc
	ln -s ~/.config/dot-files/bash_aliases ~/.bash_aliases

install nvm	

install node
install tldr
	npm install -g tldr

insatll rusit
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  	rustup target add wasm32-unknown-unknown
	sudo apt-get install libssl-dev

install cargo-libs:
  	cargo install cargo-update simple-http-server cargo-watch bat cargo-generate wasm-bindgen-cli

install wasm-pack
	 curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh 


install lunarvim
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
	ln -s ~/.config/dot-files/lvim/ ~/.config/lvim/

Install fonts
	https://www.nerdfonts.com/font-downloads
	mkdir ~/.local/share/fonts
	mv {{Font}} ~/.local/share/fonts/
	fc-cache -f -v

