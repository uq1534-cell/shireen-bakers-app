#!/bin/bash
set -e

echo "--- Checking for Flutter ---"
if ! command -v flutter &> /dev/null; then
  echo "--- Installing Flutter ---"
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 /tmp/flutter
  export PATH="$PATH:/tmp/flutter/bin"
else
  echo "--- Flutter already available ---"
fi

echo "--- Flutter version ---"
flutter --version

echo "--- Enabling web support ---"
flutter config --enable-web

echo "--- Getting packages ---"
flutter pub get

echo "--- Building Flutter web (release) ---"
flutter build web --release --web-renderer html

echo "--- Build complete ---"
