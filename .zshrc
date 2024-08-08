adot="$HOME/."
ameta="$HOME/meta/"

export SSH_AUTH_SOCK="$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
source "${adot}config/op/plugins.sh"
export PATH="${ameta}gitfuncs/:$PATH"

brew_prefix="/opt/homebrew"
eval "$("$brew_prefix/bin/brew" shellenv)"

# Build ${ameta}zplugins.zsh from ${ameta}zplugins.txt unless the former is newer.
if [[ ! "${adot}zplugins.zsh" -nt "${ameta}zplugins.txt" ]]; then
  # Build ${ameta}zplugins.txt in a subshell.
  (
    source ${ameta}antidote/antidote.zsh
    antidote bundle <"${ameta}zplugins.txt" >"${adot}zplugins.zsh"
  )
fi

# Custom functions
zfuncs_path="${ameta}zfuncs"
autoload -U $zfuncs_path/*(.:t)

fpath=($zfuncs_path "$brew_prefix/share/zsh/site-functions" $fpath);

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-${adot}cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-${adot}cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit
compinit
if [[ ! "${adot}zcompdump.zwc" -nt "${adot}zcompdump" ]]; then
  zcompile -R -- "${adot}zcompdump.zwc" "${adot}zcompdump"
fi
# Other autocomplete
source "${ameta}zcomp.zsh"

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Lazy-load languages
source "${ameta}zlanguages/java.zsh"
source "${ameta}zlanguages/golang.zsh"
source "${ameta}zlanguages/nodejs.zsh"
source "${ameta}zlanguages/python.zsh"
source "${ameta}zlanguages/rust.zsh"
source "${ameta}zlanguages/solidity.zsh"

# Load plugins
source "${ameta}fzf-tab/fzf-tab.plugin.zsh"
source "${adot}zplugins.zsh"
source "${ameta}p10k.zsh"

# Aliases
for alias_path in ${ameta}zalias/*.zsh; do
  source $alias_path
done
