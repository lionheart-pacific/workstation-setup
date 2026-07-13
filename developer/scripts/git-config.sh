#!/usr/bin/env sh

set -eu

WORKSPACE_DIR="$HOME/workspace"

echo "Configuring Git..."

if [ ! -r /dev/tty ]; then
    echo "No terminal available to prompt for Git identity; skipping." >&2
else
    printf "Enter your full name for Git commits: " > /dev/tty
    read -r GIT_NAME < /dev/tty
    if [ -n "$GIT_NAME" ]; then
        git config --global user.name "$GIT_NAME"
        echo "Set Git user.name to '$GIT_NAME'."
    else
        echo "No name entered; leaving Git user.name unset." >&2
    fi

    printf "Enter your work email address for Git commits: " > /dev/tty
    read -r GIT_EMAIL < /dev/tty
    if [ -n "$GIT_EMAIL" ]; then
        git config --global user.email "$GIT_EMAIL"
        echo "Set Git user.email to '$GIT_EMAIL'."
    else
        echo "No email entered; leaving Git user.email unset." >&2
    fi
fi

if [ ! -d "$WORKSPACE_DIR" ]; then
    echo "Creating workspace directory at $WORKSPACE_DIR..."
    mkdir -p "$WORKSPACE_DIR"
else
    echo "Workspace directory already exists at $WORKSPACE_DIR."
fi
