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

read -r CONSENT

if [ "$CONSENT" != "y" ]; then
  exit 0
fi

echo ""
echo "######################"
echo "#Ading Charm.sh repo.#"
echo "######################"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list

echo ""
echo "####################"
echo "#Ading Docker repo.#"
echo "####################"
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

echo ""
echo "################"
echo "#Update system.#"
echo "################"
sudo apt update
sudo apt upgrade -y

echo ""
echo "#####################"
echo "#Instaling APT deps.#"
echo "#####################"
sudo apt install build-essential cmake libasound2-dev \
  libdbus-1-dev libgit2-dev libgl1-mesa-dev libluajit-5.1-dev \
  libpulse-dev libssh-dev libssl-dev libx11-dev libxcb-xfixes0-dev \
  libxi-dev pkg-config python3-pip stow xclip libmagickwand-dev \
  libgraphicsmagick1-dev luajit lua5.1 liblua5.1-dev \
  luarocks python3.10-venv libudev-dev fzf libxxf86vm-dev \
  gum wishlist docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo ""
echo "########################"
echo "#Instaling python deps.#"
echo "########################"
python3 -m pip install keyring pynvim

echo ""
echo "##############"
echo "#Update bash.#"
echo "##############"
rm ~/.bashrc ~/.bash_aliases
stow -t "$HOME" bash
source "$HOME/.bashrc"

echo ""
echo "###################"
echo "#Creating folders.#"
echo "###################"
mkdir -p ~/.local/bin

echo ""
echo "################################"
echo "#Instaling 🦀 RUST 🦀 and deps.#"
echo "################################"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.bashrc"
rustup target add wasm32-unknown-unknown
rustup component add rls rust-analysis rust-src rust-analyzer rustfmt
sudo ln -s "$(rustup which rust-analyzer)" /usr/local/bin/rust-analyzer
cargo install --locked cargo-update cargo-watch bat bob-nvim cargo-generate cargo-info cargo-wgsl exa fd-find license-generator ripgrep simple-http-server starship wasm-bindgen-cli tokei
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

# Rust programs config config
stow -t "$HOME" starship

echo ""
echo "##################"
echo "#Installing NVIM.#"
echo "##################"
bob install stable
bob use stable
stow -t "$HOME" nvim

echo ""
echo "##########################"
echo "#Installing NVM and deps.#"
echo "##########################"
./scripts/install-update-nvm
source "$HOME/.bashrc"
nvm install node
npm install -g neovim tree-sitter-cli

echo ""
echo "######################"
echo "#Installing Lua deps.#"
echo "######################"
luarocks install --local busted
sudo luarocks install magick

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
stow -t "$HOME" kitty
source "$HOME/.bashrc"
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$(which kitty)" 50

echo ""
echo "########################"
echo "#Instaling  HASKELL .#"
echo "########################"
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

echo ""
echo "#####################"
echo "#Instaling FlatPaks.#"
echo "#####################"
flatpak install flathub org.kde.krita org.inkscape.Inkscape com.obsproject.Studio org.kde.kdenlive com.spotify.Client com.discordapp.Discord md.obsidian.Obsidian

echo ""
echo "######################"
echo "#Set up Docker group.#"
echo "######################"
sudo groupadd docker
sudo usermod -aG docker "$USER"
