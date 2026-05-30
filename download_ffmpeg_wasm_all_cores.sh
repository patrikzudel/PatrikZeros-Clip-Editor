#!/usr/bin/env bash
set -euo pipefail

# Put this script in the same folder as the editor HTML.
# It downloads both the stable single-core FFmpeg WASM core and the multicore core-mt.

command -v wget >/dev/null 2>&1 || {
  echo "Error: wget is required but was not found."
  echo "Install it with: sudo apt install wget"
  exit 1
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

rm -rf ffmpeg
mkdir -p ffmpeg/ffmpeg ffmpeg/util ffmpeg/core ffmpeg/core-mt

download() {
  local url="$1"
  local output="$2"

  echo "Downloading $output"
  wget \
    --tries=3 \
    --timeout=60 \
    --continue \
    --output-document="$output" \
    "$url"

  if [ ! -s "$output" ]; then
    echo "Error: downloaded file is missing or empty: $output"
    exit 1
  fi
}

# @ffmpeg/ffmpeg wrapper files
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/index.js"   "ffmpeg/ffmpeg/index.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/worker.js"  "ffmpeg/ffmpeg/worker.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/classes.js" "ffmpeg/ffmpeg/classes.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/types.js"   "ffmpeg/ffmpeg/types.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/const.js"   "ffmpeg/ffmpeg/const.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/errors.js"  "ffmpeg/ffmpeg/errors.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.12.15/dist/esm/utils.js"   "ffmpeg/ffmpeg/utils.js"

# @ffmpeg/util files
download "https://cdn.jsdelivr.net/npm/@ffmpeg/util@0.12.2/dist/esm/index.js"  "ffmpeg/util/index.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/util@0.12.2/dist/esm/const.js"  "ffmpeg/util/const.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/util@0.12.2/dist/esm/errors.js" "ffmpeg/util/errors.js"

# Stable single-core core
download "https://cdn.jsdelivr.net/npm/@ffmpeg/core@0.12.10/dist/esm/ffmpeg-core.js"   "ffmpeg/core/ffmpeg-core.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/core@0.12.10/dist/esm/ffmpeg-core.wasm" "ffmpeg/core/ffmpeg-core.wasm"

# Multicore core-mt
download "https://cdn.jsdelivr.net/npm/@ffmpeg/core-mt@0.12.10/dist/esm/ffmpeg-core.js"        "ffmpeg/core-mt/ffmpeg-core.js"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/core-mt@0.12.10/dist/esm/ffmpeg-core.wasm"      "ffmpeg/core-mt/ffmpeg-core.wasm"
download "https://cdn.jsdelivr.net/npm/@ffmpeg/core-mt@0.12.10/dist/esm/ffmpeg-core.worker.js" "ffmpeg/core-mt/ffmpeg-core.worker.js"

echo
echo "Done."
echo
echo "Folder should now include:"
echo "  ./ffmpeg/core/ffmpeg-core.js"
echo "  ./ffmpeg/core/ffmpeg-core.wasm"
echo "  ./ffmpeg/core-mt/ffmpeg-core.js"
echo "  ./ffmpeg/core-mt/ffmpeg-core.wasm"
echo "  ./ffmpeg/core-mt/ffmpeg-core.worker.js"
echo
echo "Use the COOP/COEP server for multicore:"
echo "  python3 serve_coop_coep.py"
