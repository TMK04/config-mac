# Add any commands which depend on golang here
lazy_golang_aliases=('goenv' 'go')

load_golang() {
  for lazy_golang_alias in $lazy_golang_aliases
  do
    unalias $lazy_golang_alias
  done

  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOENV_SHELL=zsh
  
  if [ "${PATH#*$GOENV_ROOT/shims}" = "${PATH}" ]; then
    export PATH="$PATH:$GOENV_ROOT/shims"
  fi
  source "$HOME/.goenv/completions/goenv.zsh"
  command goenv rehash 2>/dev/null
  goenv() {
    local command
    command="$1"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
    rehash|shell)
      eval "$(goenv "sh-$command" "$@")";;
    *)
      command goenv "$command" "$@";;
    esac
  }
  goenv rehash --only-manage-paths

  unfunction load_golang
}

for lazy_golang_alias in $lazy_golang_aliases
do
  alias $lazy_golang_alias="load_golang && $lazy_golang_alias"
done
