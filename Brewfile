cask "temurin@21", postinstall: "echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 21)' >> ~/.zshrc"

brew "postgresql@17", link: true

brew "nss"
brew "mkcert", postinstall: "${HOMEBREW_PREFIX}/bin/mkcert -install"

brew "node"
brew "pnpm"
brew "nvm", postinstall: "mkdir -p ~/.nvm && echo 'export NVM_DIR=\"$HOME/.nvm\"' >> ~/.zshrc' && echo '[ -s \"/opt/homebrew/opt/nvm/nvm.sh\" ] && \. \"/opt/homebrew/opt/nvm/nvm.sh\"  # This loads nvm' >> ~/.zshrc && echo '[ -s \"/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm\" ] && \. \"/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm\" # This loads nvm bash_completion' >> ~/.zshrc && nvm install"

# Conflicts with JAMF-installed Docker
# cask "docker"

tap "buildpacks/tap"
brew "pack"

cask "google-cloud-sdk", postinstall: "${HOMEBREW_PREFIX}/bin/gcloud components update"

brew "sops"
