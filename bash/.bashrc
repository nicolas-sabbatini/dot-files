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

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Exports
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/dot-files/scripts:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Set editor
export EDITOR="nvim"

# Load aliases
source "$HOME/.bash_aliases"

# Load completion
source "$HOME/.bash_completion/alacritty"
source "$HOME/.bash_completion/bun"

# Load cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Load Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Load ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

eval "$(starship init bash)"