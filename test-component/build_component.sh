#!/bin/bash

NAME="tutorial"
COMPONENT_FILE="$NAME-component.wasm"

echo "In order to build the $NAME component, you need "
echo "to install wasm-tools from Bytecode Alliance."

echo "Downloading wasi_snapshot_preview1..."
curl -O -L https://github.com/bytecodealliance/preview2-prototyping/releases/download/latest/wasi_preview1_component_adapter.reactor.wasm

echo "Preparing wasi_snapshot_preview1..."
mv wasi_preview1_component_adapter.reactor.wasm wasi_snapshot_preview1.wasm

echo "Building the $NAME WebAssembly module..."
cargo build --target wasm32-wasi --release

echo "Turning the module into a WebAssembly Component..."
wasm-tools component new ./target/wasm32-wasi/release/lib.wasm \
    -o $COMPONENT_FILE --adapt ./wasi_snapshot_preview1.wasm

wasm-tools print $COMPONENT_FILE | more
