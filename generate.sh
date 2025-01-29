#!/bin/bash
set -e

git submodule update --init --remote
rm -rf ./src ./target

cp ./miracl-core/rust/*.rs .
cp ./miracl-core/rust/config64.py .

mv ./Cargo.toml ./Cargo.toml.bak

# select bn254 curve in config

echo -ne '28\n0\n' | python3 -c "input_text = input('Enter text: '); print(f'\"{input_text}\"')"
echo -ne '28\n0\n' | python3 ./config64.py

rm ./*.rs ./*.py
mv ./mcore/src/ .
rm -rf mcore

mv ./Cargo.toml.bak ./Cargo.toml
