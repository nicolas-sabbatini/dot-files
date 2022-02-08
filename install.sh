#!/bin/bash

echo "#######################"
echo "#Instaling 🦀 RUST 🦀.#"
echo "#######################"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-unknown-unknown
cargo install --locked cargo-update simple-http-server cargo-watch bat cargo-generate wasm-bindgen-cli starship

