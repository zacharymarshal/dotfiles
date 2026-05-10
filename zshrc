export PATH=$HOME/bin:/usr/local/bin:$PATH

# History
HISTFILE="$HOME/.zsh_history/history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST

# Sensible interactive defaults
setopt AUTO_CD               # type a directory name to cd into it
setopt INTERACTIVE_COMMENTS  # allow `#` comments in interactive shell
setopt NO_CASE_GLOB          # case-insensitive globbing
setopt CORRECT_ALL           # prompt to fix typos in command args (cd Doucments → Documents)

# Aliases
[ -f $HOME/dotfiles/aliases ] && source $HOME/dotfiles/aliases

# Completion system
autoload -Uz compinit && compinit

# Make aliased commands inherit completion from their target
compdef g=git
compdef h=history

# Highlighted, navigable completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

# Limit `git checkout`/`git switch` completion to branches only
# (no modified files, commit hashes, or tags)
zstyle ':completion::complete:git-checkout:argument-rest:' tag-order \
  'tree-ishs commits heads recent-branches heads-local heads-remote remote-branch-names-noprefix'
zstyle ':completion::complete:git-switch:argument-rest:' tag-order \
  'tree-ishs commits heads recent-branches heads-local heads-remote remote-branch-names-noprefix'

# Shift-Tab cycles backwards through completion menu
bindkey '^[[Z' reverse-menu-complete

# Prompt theme
source $HOME/dotfiles/zulu.zsh-theme

# Environment
export LANG=en_US.UTF-8
export EDITOR="nvim"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

fastfetch
