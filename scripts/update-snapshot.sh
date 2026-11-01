#!/bin/sh
# Refresh the offline fallback catalog (used only when GitHub can't be reached).
set -e
cd "$(dirname "$0")/.."
URL="https://raw.githubusercontent.com/Nicolaslahri/onepacedownloader/data/episode_index.json"
{ printf 'window.ONEPACE_SNAPSHOT = '; curl -fsSL "$URL"; printf ';\n'; } > catalog-snapshot.js.tmp
mv catalog-snapshot.js.tmp catalog-snapshot.js
echo "Updated catalog-snapshot.js ($(wc -c < catalog-snapshot.js) bytes)"
