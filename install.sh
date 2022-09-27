#!/bin/bash

echo "################################################################################################"
echo "#                                                                                              #"
echo "# ███    ██ ██ ██   ██     ██████   ██████  ████████       ███████ ██ ██      ███████ ███████  #"
echo "# ████   ██ ██ ██  ██      ██   ██ ██    ██    ██          ██      ██ ██      ██      ██       #"
echo "# ██ ██  ██ ██ █████       ██   ██ ██    ██    ██    █████ █████   ██ ██      █████   ███████  #"
echo "# ██  ██ ██ ██ ██  ██      ██   ██ ██    ██    ██          ██      ██ ██      ██           ██  #"
echo "# ██   ████ ██ ██   ██     ██████   ██████     ██          ██      ██ ███████ ███████ ███████  #"
echo "#                                                                                              #"
echo "################################################################################################"
echo ""
echo "WARNING: This script will install a LOT of software and it don't give you option to not do it "
echo "         if you don't want to do it, press CTRL+C to cancel this script."
echo "         Also, the scrip espect that if an error occurs YOU must solve it manually."
echo "         So if you don't know what you are doing, press CTRL+C to cancel this script."
echo ""
echo "DO YOU UNDERTAND AND WANT TO CONTINUE? (y/n)"

read CONSENT

if [ "$CONSENT" != "y" ]; then
    exit 0
fi
echo ""
echo "#####################"
echo "#Instaling APT deps.#"
echo "#####################"
sudo apt install build-essential\
  cmake\
  libasound2-dev\
  libdbus-1-dev\
  libgit2-dev\
  libgl1-mesa-dev\
  libpulse-dev\
  libssh-dev\
  libssl-dev\
  libx11-dev\
  libxi-dev\
  pkg-config\
  python3-pip\
  stow\
  xclip

echo ""
echo "########################"
echo "#Instaling python deps.#"
echo "########################"
python3 -m pip install keyring\
  pynvim
  
echo ""
echo "##############"
echo "#Update bash.#"
echo "##############"
rm ~/.bashrc ~/.bash_aliases
stow -t $HOME bash
source ~/.bashrc

echo ""
echo "###################"
echo "#Creating folders.#"
echo "###################"
mkdir -p ~/.local/bin

echo ""
echo "##################"
echo "#Installing NVIM.#"
echo "##################"
./scripts/install-update-nvim
stow -t $HOME nvim

echo ""
echo "##########################"
echo "#Installing NVM and deps.#"
echo "##########################"
./scripts/install-update-nvm
nvm install --lts
npm install -g tldr\
  neovim\
  tree-sitter-cli

echo ""
echo "################################"
echo "#Instaling 🦀 RUST 🦀 and deps.#"
echo "################################"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-unknown-unknown
rustup component add rls rust-analysis rust-src

cargo install --locked cargo-update\
  bacon\
  bat\
  cargo-edit\
  cargo-generate\
  evcxr_repl\
  fd-find\
  license-generator\
  ripgrep\
  simple-http-server\
  starship\
  wasm-bindgen-cli\

curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh 

echo ""
echo "#########################"
echo "#🚀 Going to the moon 🚀#"
echo "#########################"
stow -t $HOME starship

echo ""
echo "############################"
echo "#Instaling 🌕 LUNAR VIM 🌕.#"
echo "############################"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -s ~/.config/dot-files/lvim ~/.config/lvim
rm -r ~/.config/lvim
stow -t $HOME lvim

echo ""
echo "########################"
echo "#Instaling 😸 KITTY 😸.#"
echo "########################"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
stow -t $HOME kitty
source ~/.bashrc
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50

echo ""
echo "###############"
echo "#Update fonts.#"
echo "###############"
stow -t $HOME fontconfig
fc-cache -f -v
