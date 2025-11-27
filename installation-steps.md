# Base deps

## Fedora:

```bash
sudo dnf install luarocks stow git cmake freetype-devel \
  fontconfig-devel libxcb-devel libxkbcommon-devel g++ xclip \
  python3-pip alsa-lib-devel mesa-libGL-devel libX11-devel \
  libXrandr-devel libXi-devel libXcursor-devel libXinerama-devel libatomic \
  wayland-devel wayland-protocols-devel clang-devel systemd-devel \
  expat-devel pcre2-devel libzstd-devel gtk3-devel libasan-static libasan \
  ImageMagick ImageMagick-devel fzf
```

## Ubuntu

```bash
sudo apt install build-essential cmake libasound2-dev \
  libdbus-1-dev libgit2-dev libgl1-mesa-dev libluajit-5.1-dev \
  libpulse-dev libssh-dev libssl-dev libx11-dev libxcb-xfixes0-dev \
  libxi-dev pkg-config python3-pip stow xclip libmagickwand-dev \
  libgraphicsmagick1-dev luajit lua5.1 liblua5.1-dev \
  luarocks libudev-dev fzf libxxf86vm-dev flatpak
```

# Flatpak

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.kde.krita \
  org.inkscape.Inkscape \
  com.obsproject.Studio \
  com.spotify.Client \
  com.discordapp.Discord \
  com.github.tchx84.Flatseal
```

# Bash

```bash
rm ~/.bashrc ~/.bash_aliases
stow -t "$HOME" bash
source "$HOME/.bashrc"
mkdir -p ~/.local/bin
stow -t "$HOME" nvim
stow -t "$HOME" ghostty
stow -t "$HOME" starship
```

# Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.bashrc"
rustup component add rust-analysis rust-src rust-analyzer rustfmt
cargo install --locked cargo-update \
  cargo-watch \
  bat \
  bob-nvim \
  eza \
  fd-find \
  license-generator \
  ripgrep \
  simple-http-server \
  starship \
  tokei
```

# Nvim

```bash
bob install stable
bob use stable
```

# Lua

```bash
luarocks install --local busted
```

# Deno

```bash
curl -fsSL https://deno.land/install.sh | sh
```

# NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

# ZVM

```bash
curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
```
