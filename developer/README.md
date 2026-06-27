# Developer Configuration

This directory collects developer configuration items that are managed directly by developers (not covered by MDM) and
are important for keeping our environments consistent. The goal is to keep this list concise and focused on aspects of
setup that support smooth workflows and pairing across machines. Items that aren't relevant to that, such as personal
customizations, should be left out. Contributions are encouraged.

## Bootstrap

To provision a new machine, run the bootstrap script. It installs Homebrew, installs our shared applications, configures
Git, the Dock, Rectangle, and macOS preferences.

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/lionheart-pacific/workstation-setup/main/developer/bootstrap.sh)"
```

## Applications

Applications are installed from the [Brewfile](./Brewfile) with `brew bundle`. The bootstrap script does this for you. To
update an existing machine after the Brewfile changes, run `brew bundle` from this directory.

## Rectangle

Rectangle is used for window management. The bootstrap script imports the shared
[RectangleConfig.json](./RectangleConfig.json) so shortcuts are consistent across machines. You can also import/export
this file from Rectangle's settings. Contributions to improve mappings are welcome.

## System Preferences

The bootstrap script disables the `Search man Page Index in Terminal` service so it doesn't claim Cmd‑Shift‑A, which
conflicts with IntelliJ's Find Action.
