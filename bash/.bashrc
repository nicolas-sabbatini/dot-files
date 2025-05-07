__append_to_path() {
  case ":$PATH:" in
  *:$1:*) ;;
  *)
    export PATH="$1:$PATH"
    ;;
  esac

}

# Forward search dont send terminal to sleep (ctrl+s)
[[ $- == *i* ]] && stty -ixon

# History conf
# Ignore duplicate lines
HISTCONTROL=ignoreboth
# History size on memory and on disc
HISTSIZE=10000
HISTFILESIZE=20000
# Append bash commands to history file
shopt -s histappend

# Less
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  source "$HOME/.bash_completion/exercism_completion.bash"
fi

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Exports
__append_to_path "$HOME/.local/bin"
__append_to_path "$HOME/.cargo/bin"
__append_to_path "$HOME/.config/dot-files/scripts"
__append_to_path "$HOME/.local/share/bob/nvim-bin"
__append_to_path "$HOME/go/bin"
__append_to_path "$HOME/.luarocks/bin"

# Set editor
export EDITOR="nvim"

# Load aliases
source "$HOME/.bash_aliases"

# Load cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Load ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Load Go
[ -s "/usr/local/go/bin" ] && __append_to_path "/usr/local/go/bin"

# Load Zig
[ -s "$HOME/.zvm/bin" ] && __append_to_path "$HOME/.zvm/bin"

eval "$(starship init bash)"
. "/home/nicosabbatini/.deno/env"