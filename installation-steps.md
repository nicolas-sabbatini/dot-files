<!--toc:start-->

- [Main:](#main)
- [MacOS Only](#macos-only)
- [Dependencies:](#dependencies)
- [Steps](#steps)
- [Optional (Quality of life):](#optional-quality-of-life)
<!--toc:end-->

# Main:

## MacOS Only

- Install brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Dependencies:

- install [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```bash
# Install AppImage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/.local/bin/nvim
```

- install xclip
- install stow
- install [nvm](https://github.com/nvm-sh/nvm#install--update-script)
- Install your favorite [nerdfont](https://www.nerdfonts.com/font-downloads)

```bash
# Linux add to fonts
unzip {{Font name}}
mkdir ~/.local/share/fonts
mv {{Font name}}* ~/.local/share/fonts/
fc-cache -f -v
```

## Steps

- change bashrc and bash_alias:

```bash
rm ~/.bashrc ~/.bash_aliases
stow -t $HOME bash
source ~/.bashrc
```

- install node

```bash
nvm install --lts
```

- install tldr

```bash
npm install -g tldr
```

- install rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-unknown-unknown
rustup component add rls rust-analysis rust-src
# on pop os
sudo apt-get install libssl-dev
```

- install cargo-libs:

```bash
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
```

- install wasm-pack

```bash
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
```

- install lunarvim

```bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
rm -r ~/.config/lvim
stow -t $HOME lvim
```

- link starship config

```bash
ln -s ~/.config/dot-files/starship.toml ~/.config/starship.toml
```

- install kitty

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
stow -t $HOME kitty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
```

# Optional (Quality of life):

- install alacritty

```bash
cargo install alacritty
stow -t $HOME alacritty
```

- install cheat.sh (you don't want to use the "cheat" script)

```bash
curl https://cht.sh/:cht.sh > ~/.local/bin/cht.sh
sudo chmod +x ~/.local/bin/cht.sh
```

- nvim nik instad of `lunarvim` (Work in progres)

```bash
stow -t $HOME nvim
```
