# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH="$HOME/.oh-my-zsh"
 zstyle ':omz:update' mode reminder

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git docker docker-compose fd macos node npm nvm ripgrep rust)

source $ZSH/oh-my-zsh.sh

export LANG="es_ES.UTF-8"
export LC_COLLATE="es_ES.UTF-8"
export LC_CTYPE="es_ES.UTF-8"
export LC_MESSAGES="es_ES.UTF-8"
export LC_MONETARY="es_ES.UTF-8"
export LC_NUMERIC="es_ES.UTF-8"
export LC_TIME="es_ES.UTF-8"
export LC_ALL="es_ES.UTF-8"

# Forward search dont send terminal to sleep (ctrl+s)
stty -ixon
# History conf
# Ignore duplicate lines
HISTCONTROL=ignoreboth
# History size on memory and on disc
HISTSIZE=10000
HISTFILESIZE=20000
# Less
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Exports
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/dot-files/scripts:$PATH"
export PATH=$(brew --prefix)"/opt/python@3.9/libexec/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Set editor
export EDITOR="nvim"

# Set kitty socket
export KITTY_LISTEN_ON=unix:/tmp/mykitty-$PPID

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Load Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

#Load pnpm
export PNPM_HOME="/Users/nicolas.sabbatini/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Load aliases
source "$HOME/.bash_aliases"

# Load cargo
source "$HOME/.cargo/env"

#Start starship
eval "$(starship init zsh)"


[ -f "/Users/nicolas.sabbatini/.ghcup/env" ] && source "/Users/nicolas.sabbatini/.ghcup/env" # ghcup-env

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
