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
echo "WARNING: This script will install a large amount of software without prompting for confirmation."
echo "         It is intended to be run ONLY on Pop!_OS."
echo "         If you do NOT want to proceed, press CTRL+C now to cancel."
echo ""
echo "         IMPORTANT: If an error occurs during installation, YOU are responsible for fixing it manually."
echo "         If you are unsure about what this script does, it is strongly recommended to press CTRL+C and exit."
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
  gum wishlist docker-ce docker-ce-cli containerd.io docker-buildx-plugin \
  docker-compose-plugin bison libgtk-4-dev libadwaita-1-dev \
  blueprint-compiler gettext libxml2-utils libclang-dev libfontconfig-dev \
  libxkbcommon-dev imagemagick mesa-common-dev libglu1-mesa-dev libgl-dev \
  libxcursor-dev libxext-dev libxfixes-dev libxinerama-dev libxrandr-dev \
  libxrender-dev libegl-dev libwayland-dev

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
cargo install --locked cargo-update \
  cargo-watch \
  bat \
  bob-nvim \
  cargo-generate \
  cargo-info \
  cargo-wgsl \
  exa \
  fd-find \
  license-generator \
  ripgrep \
  simple-http-server \
  starship \
  wasm-bindgen-cli \
  tokei
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
source "$HOME/.bashrc"

# Rust programs config
stow -t "$HOME" starship
source "$HOME/.bashrc"

echo ""
echo "##################"
echo "#Installing NVIM.#"
echo "##################"
bob install stable
bob use stable
stow -t "$HOME" nvim
source "$HOME/.bashrc"

echo ""
echo "######################"
echo "#Installing Lua deps.#"
echo "######################"
luarocks install --local busted
sudo luarocks install magick

echo ""
echo "#####################"
echo "#Instaling FlatPaks.#"
echo "#####################"
flatpak install flathub org.kde.krita \
  org.inkscape.Inkscape \
  com.obsproject.Studio \
  org.kde.kdenlive \
  com.spotify.Client \
  com.discordapp.Discord \
  md.obsidian.Obsidian \
  com.github.tchx84.Flatseal \
  com.valvesoftware.Steam

echo ""
echo "######################"
echo "#Set up Docker group.#"
echo "######################"
sudo groupadd docker
sudo usermod -aG docker "$USER"

echo ""
echo "##################"
echo "#Installing DENO.#"
echo "##################"
curl -fsSL https://deno.land/install.sh | sh

echo ""
echo "################"
echo "#Installing Go.#"
echo "################"
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source "$HOME/.bashrc"
gvm install go1.24.2 -B
source "$HOME/.bashrc"

echo "################################"
echo "# The installation is finished #"
echo "#  Please reboot the computer  #"
echo "################################"
