export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
source ~/.config/op/plugins.sh
export PATH="$HOME/.gitfuncs/:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Build ~/.zsh_plugins.zsh from ~/.zsh_plugins.txt unless the former is newer.
if [[ ! ~/.zsh_plugins.zsh -nt ~/.zsh_plugins.txt ]]; then
  # Build ~/.zsh_plugins.txt in a subshell.
  (
    source ~/.antidote/antidote.zsh
    antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
  )
fi

# Custom functions
fpath=(~/.zfuncs $fpath);
autoload -U $fpath[1]/*(.:t)

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit
compinit
if [[ ! ~/.zcompdump.zwc -nt ~/.zcompdump ]]; then
  zcompile -R -- ~/.zcompdump.zwc ~/.zcompdump
fi
# Other autocomplete
source ~/.zcomp.zsh

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source ~/.zoxide.zsh
source ~/.zsh_plugins.zsh
source ~/.p10k.zsh

# Lazy-load languages
source ~/.zsh_languages/golang.zsh
source ~/.zsh_languages/nodejs.zsh
source ~/.zsh_languages/python.zsh
source ~/.zsh_languages/rust.zsh

# Aliases
for _alias in ~/.zalias/*.zsh; do
  source $_alias
done
