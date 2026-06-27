#!/usr/bin/env sh

set -eu

echo "Configuring macOS preferences..."

# Disable the "Search man Page Index in Terminal" service so it does not claim
# the Cmd-Shift-A shortcut, which conflicts with IntelliJ's Find Action.
SERVICE="com.apple.Terminal - Search man Page Index in Terminal - searchManPages"

defaults write pbs NSServicesStatus -dict-add "$SERVICE" '{
    "enabled_context_menu" = 0;
    "enabled_services_menu" = 0;
    "presentation_modes" = {
        ContextMenu = 0;
        ServicesMenu = 0;
    };
}'

# Re-register services so the change takes effect.
/System/Library/CoreServices/pbs -flush >/dev/null 2>&1 || true
