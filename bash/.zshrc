# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
 zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git docker docker-compose fd macos node npm nvm ripgrep rust)

source $ZSH/oh-my-zsh.sh

export LANG=C LC_CTYPE=UTF-8
export LC_ALL=C
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
# Load aliases
. $HOME/.bash_aliases
# Exports
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/dot-files/scripts:$PATH"
export EDITOR="nvim"
source "$HOME/.cargo/env"
# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

. "$HOME/.cargo/env"

