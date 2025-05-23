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
alias lz='eza --icons --long --all --no-user --no-time --group-directories-first'
alias ls='ls --color'

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias cdd='cd ~/dotfiles'
alias getip="ifconfig en0 | grep 'inet ' | awk '{print $2}'"
alias obs="code /Users/sydalwedaie/vaults/Alpine/.obsidian/snippets"



#####################
# Shell integrations
#####################
eval "$(fzf --zsh)" # C-r to search history

export PATH="/opt/homebrew/opt/ruby@3.2/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"
export PATH="/opt/homebrew/Cellar/ctags/5.8_2/bin:$PATH"

export BAT_THEME=zenburn

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Windsurf
export PATH="/Users/sydalwedaie/.codeium/windsurf/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Zoxide
eval "$(zoxide init zsh)"
