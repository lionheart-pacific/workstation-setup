# Developer Configuration

This directory holds the workstation bootstrap and the configuration it applies. These are the developer-managed parts
of our setup (not covered by MDM) that should stay consistent across machines. Developers usually run the bootstrap from
a link in our onboarding docs, so these notes are mainly for maintaining it. Keep it lean, leave out personal
customizations, and feel free to contribute.

## Bootstrap

`bootstrap.sh` provisions a new machine. It installs Homebrew, installs the [Brewfile](./Brewfile) applications, and runs
the configuration steps in [`scripts/`](./scripts). Run it with:

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/lionheart-pacific/workstation-setup/main/developer/bootstrap.sh)"
```

To change what gets installed or configured, edit the [Brewfile](./Brewfile) or the relevant script in
[`scripts/`](./scripts).
