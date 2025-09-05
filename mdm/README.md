# MDM Configuration

This directory is the source of truth for mobile device management (MDM) at Lionheart Pacific. It includes the shared
profile tracked here along with notes on items managed directly in Jamf Now.

## Profiles

The [developer.mobileconfig](./developer.mobileconfig) file is a shared configuration profile for developer machines.

### Working with the profile

The recommended way to work with this file is by using **iMazing Profile Editor**. You can install it with Homebrew:

```
brew install --cask imazing-profile-editor
```

- To understand what the file configures, open it in iMazing Profile Editor to review its configured domains.
- To discuss ideas for changes, contact IT support at ask@lionheartpacific.com.
- To proactively propose changes, edit the file in iMazing Profile Editor, save it, commit your changes, and open a pull
  request.

### Deployment

To update the profile:

1. Sign in to the company Jamf Now account.
2. Go to Blueprints > Developer > Custom Profiles.
3. Remove the existing developer profile.
4. Re-add the updated `developer.mobileconfig` file.

The update takes effect within seconds.

## Applications

Several applications are installed automatically through Jamf Now.
The exact list is maintained in the Jamf Now web portal and is not tracked in this repository.

## Policies

System-wide policies, such as password requirements and FileVault disk encryption, are also enforced through Jamf Now.
These settings are likewise managed in the Jamf Now web portal and are not tracked in this repository.
