#!/bin/zsh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$ROOT_DIR/build"

mkdir -p "$BUILD_DIR"
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$BUILD_DIR" "$ROOT_DIR/main.tex"
