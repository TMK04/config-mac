npm_set_cache() {
  local node_version npm_cache_dir
  node_version="$(nvm current)"
  npm_cache_dir="$HOME/.cache/npm/$node_version"
  if [ ! -d "$npm_cache_dir" ]; then
    mkdir -p "$npm_cache_dir"
  fi
  npm config set cache "$npm_cache_dir"
}

nvm_and_cache() {
  nvm "$@"
  case "$1" in
    use)
      npm_set_cache
      ;;
  esac
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
npm_set_cache

alias nvm="nvm_and_cache"
