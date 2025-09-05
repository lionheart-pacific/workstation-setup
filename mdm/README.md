# MDM Configuration

This directory contains resources for MDM automation. These configurations are configured manually and deployed
automatically to all developer machines through Jamf Now.

## Developer Profile

The [developer.mobileconfig](./developer.mobileconfig) file is a shared configuration profile for developer machines.

### Working with the file

The recommended way to work with this file is by using **iMazing Profile Editor**. You can install it with Homebrew:

```
brew install --cask imazing-profile-editor
```

- To understand what the file configures, open it in iMazing Profile Editor and browse.
- To discuss ideas for changes, contact IT support at ask@lionheartpacific.com.
- To proactively propose changes, edit the file in iMazing Profile Editor, save it, commit your changes, and open a pull request.

### Deployment

To update the profile:

1. Sign in to the company Jamf Now account.
2. Go to Blueprints > Developer > Custom Profiles.
3. Remove the existing developer profile.
4. Re-add the updated `developer.mobileconfig` file.

The update takes effect within seconds.
