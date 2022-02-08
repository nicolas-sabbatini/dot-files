case $- in
    *i*) ;;
      *) return;;
esac

# Forward search dont send terminal to sleep (ctrl+s)
stty -ixon

# History conf
# Ignore duplicate lines
HISTCONTROL=ignoreboth
# History size on memory and on disc
HISTSIZE=10000
HISTFILESIZE=20000
# Append bash commands to history file
shopt -s histappend

# If some command change terminal size update lines and columns
shopt -s checkwinsize

# Less
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. /usr/share/bash-completion/bash_completion

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Load aliases
. $HOME/.bash_aliases

# Load prompt
export PROMPT="FULL"
. $HOME/.config/dot-files/prompt.sh

# Exports
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/dot-files/scripts:$PATH"
export EDITOR="/usr/bin/nvim"

source "$HOME/.cargo/env"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"

