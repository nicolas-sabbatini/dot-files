# Main:
- install nvim
- install xclip
- change bashrc and bash_alias:
``` bash
rm ~/.bashrc
ln -s ~/.config/dot-files/bashrc ~/.bashrc
ln -s ~/.config/dot-files/bash_aliases ~/.bash_aliases
```

- install nvm
- install node
- install tldr
``` bash
npm install -g tldr
```

- install rust
``` bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-unknown-unknown
rustup component add rls rust-analysis rust-src
# on pop os
sudo apt-get install libssl-dev
```

- install cargo-libs:
``` bash
cargo install --locked cargo-update\
  simple-http-server\
  cargo-watch\
  bat\
  cargo-generate\
  wasm-bindgen-cli\
  starship
```

- install wasm-pack
``` bash
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh 
```

- install lunarvim
``` bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -s ~/.config/dot-files/lvim ~/.config/lvim
```

- install fonts
``` bash
# https://www.nerdfonts.com/font-downloads
# mkdir ~/.local/share/fonts
# mv {{Font}} ~/.local/share/fonts/
# fc-cache -f -v
```

# Optional:
- install alacritty
``` bash
cargo install alacritty
ln -s ~/.config/dot-files/alacritty ~/.config/alacritty
```

