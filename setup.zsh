cp "$HOME/.ssh/local-config.example" "$HOME/.ssh/local-config"

brew bundle install

git clone --depth=1 "https://github.com/mattmc3/antidote.git" ${ZDOTDIR:-$HOME}/.antidote
git clone "https://github.com/go-nv/goenv" "$HOME/.goenv"
git clone "https://github.com/nvm-sh/nvm" "$HOME/.nvm"

git clone "https://github.com/ethrgeist/git-credential-1password" "$HOME/.git-credential-1password" && \
  sudo go build -C "$HOME/.git-credential-1password" -o "/usr/local/bin/git-credential-1password" && \
rm -rf "$HOME/.git-credential-1password"

chmod -R 755 "$HOME/.gitfuncs"
chmod -R 755 "$HOME/.zalias"
chmod -R 755 "$HOME/.zfuncs"
