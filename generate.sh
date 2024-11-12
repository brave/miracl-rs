#!/bin/sh
set -e

git submodule update --init --remote
rm -rf ./src ./target

cp ./miracl-core/rust/*.rs .
cp ./miracl-core/rust/config64.py .

mv ./Cargo.toml ./Cargo.toml.bak

# select bn254 and bls12-381 curve in config
echo -e "28\n31\n0\n" | python3 ./config64.py

rm ./*.rs ./*.py
mv ./mcore/src/ .
rm -rf mcore

mv ./Cargo.toml.bak ./Cargo.toml
