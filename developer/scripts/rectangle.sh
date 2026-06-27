#!/usr/bin/env sh

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_PATH="${1:-$SCRIPT_DIR/../RectangleConfig.json}"

if [ ! -f "$CONFIG_PATH" ]; then
    echo "Rectangle config not found at $CONFIG_PATH; skipping." >&2
    exit 1
fi

echo "Importing Rectangle configuration..."

SUPPORT_DIR="$HOME/Library/Application Support/Rectangle"
mkdir -p "$SUPPORT_DIR"
cp "$CONFIG_PATH" "$SUPPORT_DIR/RectangleConfig.json"

# Rectangle reads this file on launch, applies it, then renames it with a
# timestamp so it isn't read again. Relaunch so the configuration takes effect.
if pgrep -x Rectangle >/dev/null 2>&1; then
    osascript -e 'quit app "Rectangle"' >/dev/null 2>&1 || true
fi

open -a Rectangle
