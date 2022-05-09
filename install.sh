#!/bin/bash

echo "#######################"
echo "#Instaling 🦀 RUST 🦀.#"
echo "#######################"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add wasm32-unknown-unknown

