# Make Homebrew apps available in PATH
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#####################
# ZINIT plugin manager
#####################
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


#####################
# Pure Prompt
#####################
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
# change git branch color to blue
zstyle :prompt:pure:git:branch color 245


#####################
# zsh plugins
#####################
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab # Fuzzy tab search

# Load completions (for zsh-completions plugin)
autoload -Uz compinit && compinit


#####################
# Keybindings
#####################
bindkey -v 
bindkey '^p' history-search-backward
bindkey '\e[A' history-search-backward
bindkey '^n' history-search-forward
bindkey '\e[B' history-search-forward


#####################
# History
#####################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # don't record an entry starting with a space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


#####################
# Completion styling
#####################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completion
zstyle ':completion:*' menu no # Suppress default menu, use fzf
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # Preview in fzf


#####################
# Aliases
#####################
alias ls='eza --icons --long --all --no-user --no-time --no-filesize --group-directories-first'

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias cdd='cd ~/dotfiles'



#####################
# Shell integrations
#####################
eval "$(fzf --zsh)" # C-r to search history

export PATH="/opt/homebrew/opt/ruby@3.2/bin:$PATH"

export BAT_THEME=zenburn
