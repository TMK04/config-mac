# Add any commands which depend on nodejs here
lazy_nodejs_aliases=('nvm' 'node' 'npm' 'pnpm' 'yarn')

load_nodejs() {
  for lazy_nodejs_alias in $lazy_nodejs_aliases
  do
    unalias $lazy_nodejs_alias
  done

  source ~/.zalias/nvm.zsh

  unfunction load_nodejs
}

for lazy_nodejs_alias in $lazy_nodejs_aliases
do
  alias $lazy_nodejs_alias="load_nodejs && $lazy_nodejs_alias"
done
