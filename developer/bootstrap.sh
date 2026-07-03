#!/usr/bin/env sh

set -eu

REPO="lionheart-pacific/workstation-setup"
BRANCH="main"

BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH/developer"
BREWFILE_URL="$BASE_URL/Brewfile"
DOCK_URL="$BASE_URL/scripts/dock.sh"
GIT_CONFIG_URL="$BASE_URL/scripts/git-config.sh"
RECTANGLE_URL="$BASE_URL/scripts/rectangle.sh"
RECTANGLE_CONFIG_URL="$BASE_URL/RectangleConfig.json"

echo "Starting Lionheart Pacific workstation bootstrap..."

# Shared curl options: retry on transient network failures.
CURL_RETRY="curl -fsSL --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 2"

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$($CURL_RETRY https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

if [ -x /opt/homebrew/bin/brew ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
elif [ -x /usr/local/bin/brew ]; then
    BREW_BIN="/usr/local/bin/brew"
else
    echo "Could not find Homebrew after installation."
    exit 1
fi

BREW_SHELLENV_LINE="eval \"\$($BREW_BIN shellenv zsh)\""

touch "$HOME/.zprofile"

if ! grep -F "$BREW_SHELLENV_LINE" "$HOME/.zprofile" >/dev/null 2>&1; then
    echo "Configuring Homebrew for future Terminal sessions..."
    {
        echo
        echo "# Homebrew"
        echo "$BREW_SHELLENV_LINE"
    } >> "$HOME/.zprofile"
fi

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

BREWFILE_PATH="$WORKDIR/Brewfile"

echo "Downloading Brewfile..."
$CURL_RETRY "$BREWFILE_URL" -o "$BREWFILE_PATH"

echo "Running brew bundle..."
"$BREW_BIN" bundle --file="$BREWFILE_PATH"

eval "$("$BREW_BIN" shellenv)"

GIT_CONFIG_SCRIPT_PATH="$WORKDIR/git-config.sh"

$CURL_RETRY "$GIT_CONFIG_URL" -o "$GIT_CONFIG_SCRIPT_PATH"
sh "$GIT_CONFIG_SCRIPT_PATH"

DOCK_SCRIPT_PATH="$WORKDIR/dock.sh"

$CURL_RETRY "$DOCK_URL" -o "$DOCK_SCRIPT_PATH"
sh "$DOCK_SCRIPT_PATH"

RECTANGLE_SCRIPT_PATH="$WORKDIR/rectangle.sh"
RECTANGLE_CONFIG_PATH="$WORKDIR/RectangleConfig.json"

$CURL_RETRY "$RECTANGLE_URL" -o "$RECTANGLE_SCRIPT_PATH"
$CURL_RETRY "$RECTANGLE_CONFIG_URL" -o "$RECTANGLE_CONFIG_PATH"
sh "$RECTANGLE_SCRIPT_PATH" "$RECTANGLE_CONFIG_PATH"

echo
echo "Bootstrap complete."
