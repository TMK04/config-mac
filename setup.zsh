cp "${ZDOTDIR:-$HOME}/.ssh/local-config.example" "${ZDOTDIR:-$HOME}/.ssh/local-config"

brew bundle install

git clone --depth=1 "https://github.com/mattmc3/antidote.git" ${ZDOTDIR:-$HOME}/.antidote
git clone --depth=1 "https://github.com/Aloxaf/fzf-tab" ${ZDOTDIR:-$HOME}/.fzf-tab
git clone --depth=1 "https://github.com/go-nv/goenv" "${ZDOTDIR:-$HOME}/.goenv"
git clone --depth=1 "https://github.com/nvm-sh/nvm" "${ZDOTDIR:-$HOME}/.nvm"

git clone --depth=1 "https://github.com/ethrgeist/git-credential-1password" "${ZDOTDIR:-$HOME}/.git-credential-1password" && \
  sudo go build -C "${ZDOTDIR:-$HOME}/.git-credential-1password" -o "/usr/local/bin/git-credential-1password" && \
rm -rf "${ZDOTDIR:-$HOME}/.git-credential-1password"

chmod -R 755 "${ZDOTDIR:-$HOME}/.gitfuncs"
chmod -R 755 "${ZDOTDIR:-$HOME}/.zalias"
chmod -R 755 "${ZDOTDIR:-$HOME}/.zfuncs"
