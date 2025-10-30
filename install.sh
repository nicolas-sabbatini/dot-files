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
echo "#####################"
echo "#Instaling DNF deps.#"
echo "#####################"
sudo dnf install luarocks stow git cmake freetype-devel \
  fontconfig-devel libxcb-devel libxkbcommon-devel g++ xclip \
  python3-pip alsa-lib-devel mesa-libGL-devel libX11-devel \
  libXrandr-devel libXi-devel libXcursor-devel libXinerama-devel libatomic \
  wayland-devel wayland-protocols-devel clang-devel systemd-devel \
  expat-devel pcre2-devel libzstd-devel gtk3-devel libasan-static libasan \
  ImageMagick ImageMagick-devel

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
rustup component add rust-analysis rust-src rust-analyzer rustfmt
cargo install --locked cargo-update \
  cargo-watch \
  bat \
  bob-nvim \
  exa \
  fd-find \
  license-generator \
  ripgrep \
  simple-http-server \
  starship \
  tokei

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

echo ""
echo "######################"
echo "#Installing Lua deps.#"
echo "######################"
luarocks install --local busted

echo ""
echo "#####################"
echo "#Instaling FlatPaks.#"
echo "#####################"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.kde.krita \
  org.inkscape.Inkscape \
  com.obsproject.Studio \
  com.spotify.Client \
  com.discordapp.Discord \
  com.github.tchx84.Flatseal

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
install-go-deps

echo "################################"
echo "# The installation is finished #"
echo "#  Please reboot the computer  #"
echo "################################"
