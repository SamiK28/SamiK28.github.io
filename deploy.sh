#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

echo "[1/4] flutter clean"
flutter clean

echo "[2/4] flutter pub get"
flutter pub get

echo "[3/4] flutter build web --release"
flutter build web --release

if [ ! -d "build/web" ]; then
  echo "Error: build/web not found after build." >&2
  exit 1
fi

echo "[4/4] sync build/web -> docs"
mkdir -p docs
rsync -a --delete build/web/ docs/

echo "Done. docs/ now contains the latest release web build."
