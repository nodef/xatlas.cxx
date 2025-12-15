#!/usr/bin/env bash
URL="https://github.com/jpcy/xatlas/archive/refs/heads/master.zip"
ZIP="${URL##*/}"
DIR="xatlas-master"
mkdir -p .build
cd .build

# Download the release
if [ ! -f "$ZIP" ]; then
  echo "Downloading $ZIP from $URL ..."
  curl -L "$URL" -o "$ZIP"
  echo ""
fi

# Unzip the release
if [ ! -d "$DIR" ]; then
  echo "Unzipping $ZIP to .build/$DIR ..."
  cp "$ZIP" "$ZIP.bak"
  unzip -q "$ZIP"
  rm "$ZIP"
  mv "$ZIP.bak" "$ZIP"
  echo ""
fi
cd ..

# Copy the libs to the package directory
echo "Copying libs to xatlas/ ..."
rm -rf xatlas
mkdir -p xatlas
cp -rf ".build/$DIR/source/xatlas"/* xatlas/
echo ""
