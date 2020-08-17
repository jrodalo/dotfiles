# Docs: http://zsh.sourceforge.net/Guide/zshguide.html

autoload -Uz compinit && compinit

# Case Insensitive Globbing
setopt no_case_glob

# Automatic CD
setopt auto_cd

# Corrections
setopt correct
setopt correct_all

# Completions
setopt auto_menu
setopt complete_in_word
setopt always_to_end

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' menu select

# History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=1000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{125}(%b)%f'
zstyle ':vcs_info:*' enable git

# Prompt
PROMPT='
%F{green}%~
%F{yellow}➜%f '

# Functions
function take() {
  mkdir -p $@ && cd ${@:$#}
}

# Alias
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls='ls -Glah'
alias diff='diff --color'
alias grep='grep --color --exclude-dir={.git,.svn}'
alias hs='history | grep -i'

# NVM - Node
export NVM_DIR="$HOME/.nvm"

function _install_nvm() {
  unset -f nvm npm node
  # Set up "nvm" could use "--no-use" to defer setup, but we are here to use it
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  "$@"
}

function nvm() {
  _install_nvm nvm "$@"
}

function npm() {
  _install_nvm npm "$@"
}

function node() {
  _install_nvm node "$@"
}
