#!/usr/bin/env sh

set -eu

if ! command -v dockutil >/dev/null 2>&1; then
    echo "dockutil not found on PATH; install it with 'brew install dockutil'." >&2
    exit 1
fi

echo "Configuring the Dock..."

dockutil --remove all --no-restart
dockutil --add '/Applications/Google Chrome.app' --no-restart
dockutil --add '/Applications/Linear.app' --no-restart
dockutil --add '/Applications/IntelliJ IDEA.app' --no-restart
dockutil --add '/Applications/Figma.app' --no-restart
dockutil --add '/Applications/Ghostty.app' --no-restart
dockutil --add '/System/Applications/System Settings.app'
