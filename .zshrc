export SSH_AUTH_SOCK="$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
source "$HOME/.config/op/plugins.sh"
export PATH="$HOME/.gitfuncs/:$PATH"

brew_prefix="/opt/homebrew"
eval "$("$brew_prefix/bin/brew" shellenv)"

# Build $HOME/.zsh_plugins.zsh from $HOME/.zsh_plugins.txt unless the former is newer.
if [[ ! "$HOME/.zsh_plugins.zsh" -nt "$HOME/.zsh_plugins.txt" ]]; then
  # Build $HOME/.zsh_plugins.txt in a subshell.
  (
    source $HOME/.antidote/antidote.zsh
    antidote bundle <"$HOME/.zsh_plugins.txt" >"$HOME/.zsh_plugins.zsh"
  )
fi

# Custom functions
zfuncs_path="$HOME/.zfuncs"
autoload -U $zfuncs_path/*(.:t)

fpath=($zfuncs_path "$brew_prefix/share/zsh/site-functions" $fpath);

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit
compinit
if [[ ! "$HOME/.zcompdump.zwc" -nt "$HOME/.zcompdump" ]]; then
  zcompile -R -- "$HOME/.zcompdump.zwc" "$HOME/.zcompdump"
fi
# Other autocomplete
source "$HOME/.zcomp.zsh"

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Lazy-load languages
source "$HOME/.zsh_languages/java.zsh"
source "$HOME/.zsh_languages/golang.zsh"
source "$HOME/.zsh_languages/nodejs.zsh"
source "$HOME/.zsh_languages/python.zsh"
source "$HOME/.zsh_languages/rust.zsh"
source "$HOME/.zsh_languages/solidity.zsh"

# Load plugins
source "$HOME/.fzf-tab/fzf-tab.plugin.zsh"
source "$HOME/.zsh_plugins.zsh"
source "$HOME/.p10k.zsh"

# Aliases
for alias_path in $HOME/.zalias/*.zsh; do
  source $alias_path
done
