#!/bin/bash
set -e

echo "--- Installing Flutter ---"
git clone https://github.com/flutter/flutter.git -b stable --depth 1

echo "--- Setting up Flutter ---"
export PATH="$PATH:`pwd`/flutter/bin"
flutter precache
flutter config --enable-web

echo "--- Getting packages ---"
flutter pub get

echo "--- Building web ---"
flutter build web --release

echo "--- Done! ---"