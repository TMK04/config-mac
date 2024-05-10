# Add any commands which depend on nodejs here
lazy_nodejs_aliases=('nvm' 'node' 'npm' 'pnpm' 'yarn')

load_nodejs() {
  for lazy_nodejs_alias in $lazy_nodejs_aliases
  do
    unalias $lazy_nodejs_alias
  done

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  unfunction load_nodejs
}

for lazy_nodejs_alias in $lazy_nodejs_aliases
do
  alias $lazy_nodejs_alias="load_nodejs && $lazy_nodejs_alias"
done
